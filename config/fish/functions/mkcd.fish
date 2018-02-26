function mkcd --description '`mkdir` and then `cd` into it'
	mkdir -p $argv; and cd $argv
end
