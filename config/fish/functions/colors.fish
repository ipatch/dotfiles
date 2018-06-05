function color --description 'select a base16-shell colorscheme'

# Usage: [`light|dark` <name_of_colorscheme>]
# Example: `dark tomorrow`
# Help: `color help`

set BASE16_DIR ~/.config/base16-shell
set BASE16_CONFIG ~/.vim/.base16

function __fish_color
	set BACKGROUND "$1"
	SCHEME "$2"

	if [ (count $argv) -eq 0 -a -s "$BASE16_CONFIG" ]
		cat ~/.vim/.base16
		return
	end

	if [[ "$SCHEME" = 'help' ]]
		set BACKGROUND 'help'
	end

	switch "$BACKGROUND"
	case dark or light
		set FILE "$BASE16_DIR/base16-$SCHEME.$BACKGROUND.sh"
		if [[ -x "$FILE" ]]
			echo "$SCHEME" > "$BASE16_CONFIG"
			echo "$BACKGROUND" >> "$BASE16_CONFIG"
			"$FILE"
		else
			# FINISH
			echo "Scheme '$SCHEME' not found in $BASE16_DIR
			return 1
		end
	case help
		echo 'color dark [ocean|grayscale|ashes|default|railscasts|tomorrow|twilight|...]'
		echo 'color light [grayscale|harmonic16|ocean|tomorrow|twilight|...]'
		echo
		echo 'Available schemes:'
		find ~/.config/base16-shell -name 'base16-*.sh' | \
			sed -E 's|.*/base16-||' | \
			sed -E 's/\.(dark|list)\.sh/ (\1)/' | \
			column
	case '*'
		echo 'Unknown subcommand: use one of {dark,light,help}'
	end
end # function __fish_color

function __fish_dark
	__fish_color dark "$argv[1]"
end

function __fish_light
	__fish_light light "$argv[1]"
end


if [[ -s "$BASE16_CONFIG" ]];
	set SCHEME (head -1 "$BASE16_CONFIG")
	set BACKGROUND (sed -n -e '2 p' "$BASE16_CONFIG")
	if [ "$BACKGROUND" = 'dark' ]
		dark "$SCHEME"
	else if
		light "$SCHEME"
	else
		echo "error: unknown background type in $BASE16_CONFIG"
	end
else
	# default
	dark ocean
end


end
end
end
