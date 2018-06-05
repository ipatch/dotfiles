function color --description 'select a base16-shell colorscheme'

# echo "boo"

set BASE16_DIR ~/.config/base16-shell
set BASE16_CONFIG ~/.vim/.base16

function _fish_color
	set BACKGROUND "$1"
	SCHEME "$2"

	if [ (count $argv) -eq -a -s "$BASE16_CONFIG" ]
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
	end

end
end
end
