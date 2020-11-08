set -g fisher_version 4.0.0

function fisher -a cmd -d "fish plugin manager"
    test "$cmd" = add && set cmd install && echo (set_color -o red)"fisher: \"$argv[1]\" is deprecated, use `fisher $cmd` instead"(set_color normal) >&2

    set -q XDG_DATA_HOME || set XDG_DATA_HOME ~/.local/share
    set -q fisher_path || set -g fisher_path $__fish_config_dir
    set -g fisher_data $XDG_DATA_HOME/fisher
    set -g fish_plugins $__fish_config_dir/fish_plugins

    switch "$cmd"
        case -v --version
            echo "fisher, version $fisher_version"
        case "" -h --help
            echo "usage: fisher install <plugins...>  install plugins"
            echo "       fisher remove  <plugins...>  remove installed plugins"
            echo "       fisher update  <plugins...>  update installed plugins"
            echo "       fisher update                update all installed plugins"
            echo "       fisher list    [<regex>]     list installed plugins matching regex"
            echo "options:"
            echo "       -v or --version  print fisher version"
            echo "       -h or --help     print this help message"
        case ls list
            _fisher_list | string match --entire --regex -- "$argv[2]"
        case install update remove rm
            set -l install_plugins
            set -l update_plugins
            set -l remove_plugins
            set -l old_plugins (_fisher_list)
            isatty || read -laz list
            set -l plugins $argv[2..-1] $list

            if set -q plugins[1]
                for plugin in (_fisher_plugin_parse $plugins)
                    if contains -- "$plugin" $old_plugins
                        if test "$cmd" = install || test "$cmd" = update
                            set -a update_plugins $plugin
                        else
                            set -a remove_plugins $plugin
                        end
                    else if test "$cmd" != install
                        echo "fisher: plugin not installed: \"$plugin\"" >&2 && return 1
                    else
                        set -a install_plugins $plugin
                    end
                end
            else if test "$cmd" != update
                echo "fisher: not enough arguments for command: \"$cmd\"" >&2 && return 1
            else
                test -e $fish_plugins && set -l new_plugins (_fisher_plugin_parse (string trim <$fish_plugins))

                for plugin in $new_plugins
                    if contains -- "$plugin" $old_plugins
                        set -a update_plugins $plugin
                    else
                        set -a install_plugins $plugin
                    end
                end

                for plugin in $old_plugins
                    if not contains -- "$plugin" $new_plugins
                        set -a remove_plugins $plugin
                    end
                end
            end

            set -l pid_list

            for plugin in $install_plugins $update_plugins
                fish -c "
                if test -e $plugin
                    command mkdir -p $fisher_data/@$USER    
                    set target $fisher_data/@$USER/(string replace --all --regex '^.*/' \"\" $plugin)
                    test -L \$target || command ln -sf $plugin \$target
                else 
                    set temp (command mktemp -d)
                    set name (string split \@ $plugin) || set name[2] HEAD
                    set url https://codeload.github.com/\$name[1]/tar.gz/\$name[2]
                    set -q fisher_user_api_token && set opts -u $fisher_user_api_token

                    echo fetching \$url >&2

                    if command curl $opts -Ss -w \"\" \$url 2>&1 | command tar -xzf- -C \$temp 2>/dev/null
                        command rm -rf $fisher_data/$plugin
                        command mkdir -p $fisher_data/$plugin
                        command cp -Rf \$temp/*/* $fisher_data/$plugin
                        command rm -rf \$temp
                    end
                end" >/dev/null &

                set -a pid_list $last_pid
            end

            wait $pid_list 2>/dev/null

            command mkdir -p $fisher_path/{functions,completions,conf.d}

            for plugin in $remove_plugins
                set -l data $fisher_data/$plugin
                test -e $plugin && set data $fisher_data/@$USER/(string replace --all --regex '^.*/' "" $plugin)

                set -l funcs $data/*.fish
                set -l files $data/{conf.d,functions,completions}/*
                set -q files[1] && set files (string replace --all $data $fisher_path $files)
                set -q funcs[1] && set files (string replace --all $data $fisher_path/functions $funcs) $files

                for file in $data/conf.d/*.fish
                    emit (string replace --all --regex '^.*/|\.fish$' "" $file)_uninstall
                end

                printf "removing %s\n" $files >&2
                command rm -rf $files $data
                command rm -df (string split --right --max=1 / $data)[1] 2>/dev/null
                functions -e (string replace --all --regex '^.*/|\.fish$' "" $files)
            end

            for plugin in $install_plugins $update_plugins
                set -l data $fisher_data/$plugin
                test -e $plugin && set data $fisher_data/@$USER/(string replace --all --regex '^.*/' "" $plugin)

                if test ! -e $data
                    set -e install_plugins[(contains --index -- $plugin $install_plugins)]
                    echo "fisher: invalid plugin name or host: \"$plugin\"" >&2
                    continue
                end

                contains -- "$plugin" $install_plugins && set -l event install || set -l event update

                set -l funcs $data/*.fish
                set -l files $data/{functions,conf.d}/*.fish
                set -q files[1] && set files (string replace --all $data $fisher_path $files)
                set -q funcs[1] && set files (string replace --all $data $fisher_path/functions $funcs) $files

                command cp -Rf $data/{functions,completions,conf.d} $fisher_path 2>/dev/null
                command cp -Rf $funcs $fisher_path/functions 2>/dev/null

                for file in $files
                    echo "sourcing $file" >&2
                    source $file
                    if string match --quiet --regex -- conf\.d/ $file
                        emit (string replace --all --regex '^.*/|\.fish$' "" $file)_$event
                    end
                end
            end

            functions -q fish_prompt || source $__fish_data_dir/functions/fish_prompt.fish

            set -l plugins (_fisher_list)
            set -q plugins[1] && printf "%s\n" $plugins >$fish_plugins || command rm -f $fish_plugins

            set -l total (count $install_plugins) (count $update_plugins) (count $remove_plugins)
            test "$total" != "0 0 0" && echo (string join ", " (
                test $total[1] = 0 || echo "$total[1] installed") (
                test $total[2] = 0 || echo "$total[2] updated") (
                test $total[3] = 0 || echo "$total[3] removed")
            ) "plugin/s" >&2
        case \*
            echo "fisher: unknown flag or command: \"$cmd\" (see `fisher -h`)" >&2 && return 1
    end
end

function _fisher_plugin_parse
    for plugin in $argv
        switch $plugin
            case \~\*
                string replace --all --regex '^~' ~ "$plugin"
            case \*/ /\* \*../\* ./\*
                realpath $plugin 2>/dev/null
            case \*/\*
                echo $plugin
            case ""
            case \*
                _fisher_plugin_parse ./$plugin
        end
    end
end

function _fisher_list
    for path in $fisher_data/*/*
        if test -L $path
            realpath $path
        else
            string replace --all $fisher_data/ "" $path
        end
    end
end

if functions -q _fisher_self_update || test -e $__fish_config_dir/fishfile
    function _fisher_migrate
        function _fisher_complete
            if not _fisher_list | string match --entire --regex --quiet -- jorgebucaran/fisher
                fisher install jorgebucaran/fisher 2>/dev/null
            end
            functions -e _fisher_complete
        end
        set -q XDG_DATA_HOME || set XDG_DATA_HOME ~/.local/share
        set -q XDG_CACHE_HOME || set XDG_CACHE_HOME ~/.cache
        set -q XDG_CONFIG_HOME || set XDG_CONFIG_HOME ~/.config
        set -q fisher_path || set fisher_path $__fish_config_dir

        if test -e $__fish_config_dir/fishfile
            command awk '/#|^gitlab|^ *$/ { next } $0' <$__fish_config_dir/fishfile >>$__fish_config_dir/fish_plugins
        end

        command rm -rf $__fish_config_dir/fishfile $fisher_path/{conf.d,completions}/fisher.fish {$XDG_DATA_HOME,$XDG_CACHE_HOME,$XDG_CONFIG_HOME}/fisher
        functions -e _fisher_migrate _fisher_copy_user_key_bindings _fisher_ls _fisher_fmt _fisher_self_update _fisher_self_uninstall _fisher_commit _fisher_parse _fisher_fetch _fisher_add _fisher_rm _fisher_jobs _fisher_now _fisher_help

        fisher update
    end

    echo "bootstrapping fisher $fisher_version for the first time, learn more at "(set_color --bold --underline)"https://git.io/fisher-4"(set_color normal) >&2

    _fisher_migrate
end