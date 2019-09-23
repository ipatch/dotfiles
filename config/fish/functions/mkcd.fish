function mkcd --description '`mkdir` then `cd` into it'
	mkdir -p $argv; and cd $argv
end
