tarcolorauto() {
	if [ "$1" == "activate" -o "$1" == "on" ]; then
		echo "$FUNCNAME turned on. To turn off, do \"$FUNCNAME off\"."
		tar() {
			case "$1" in
				*tvf*)   command tar "$@" | tarcolor ;;
			    *)       command tar "$@" ;;
		    esac
		}
	elif [ "$1" == "deactivate" -o "$1" == "off" ]; then
		unset -f tar
		echo "$FUNCNAME turned off."
	fi
}
