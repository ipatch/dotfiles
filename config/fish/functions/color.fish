function color --description 'select a base16-shell colorscheme'

# Usage: `color` print the current colorscheme
# Usage: [`light|dark` <name_of_colorscheme>]
# Example: `__shell_dark tomorrow`
# Help: `color help`

set -g BASE16_DIR ~/.config/base16-shell
set -g BASE16_CONFIG ~/.vim/.base16

function __shell_color
	set BACKGROUND "$argv[1]"
	set SCHEME "$argv[2]"

	if [ (count $argv) -eq 0 -a -s "$BASE16_CONFIG" ]
		cat ~/.vim/.base16
		return
	end

	if [ "$SCHEME" = 'help' ]
		set BACKGROUND 'help'
	end

	switch "$BACKGROUND"
	case __shell_dark or __shell_light
		set FILE "$BASE16_DIR/base16-$SCHEME.$BACKGROUND.sh"
		if [ -x "$FILE" ]
			echo "$SCHEME" > "$BASE16_CONFIG"
			echo "$BACKGROUND" >> "$BASE16_CONFIG"
			"$FILE"
		else
			echo "Scheme '$SCHEME' not found in $BASE16_DIR"
			return 1
		end
	case help
		echo 'color dark [ocean|grayscale|ashes|default|railscasts|tomorrow|twilight|...]'
		echo 'color light [grayscale|harmonic16|ocean|tomorrow|twilight|...]'
		echo
		echo 'Available schemes:'
		# TODO: properly list availbe color schemes!
		find ~/.config/base16-shell -name 'base16-*.sh' | \
			sed -E 's|.*/base16-||' | \
			sed -E 's/\.(dark|list)\.sh/ (\1)/' | \
			column
	case '*'
		echo 'Unknown subcommand: use one of {dark,light,help}'
	end
end # function __fish_color

function __shell_dark
	__shell_color dark "$argv[1]"
end

function __shell_light
	__shell_light light "$argv[1]"
end


if [ -s "$BASE16_CONFIG" ]
	set SCHEME (head -1 "$BASE16_CONFIG")
	set BACKGROUND (sed -n -e '2 p' "$BASE16_CONFIG")
	if [ "$BACKGROUND" = 'dark' ]
		__shell_dark "$SCHEME"
	else if [ "$BACKGROUND" = 'light' ]
		__shell_light "$SCHEME"
	else
		echo "error: unknown background type in $BASE16_CONFIG"
	end
else
	# default
	__shell_dark default # use `base16-default-dark.sh`

end # if

# call / run `__shell_color` when issuing `color` from CLI
__shell_color $argv

end # function color
