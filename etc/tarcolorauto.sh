tarcolorauto() {
    if [ "$1" = "activate" -o "$1" = "on" ]; then
        echo "tarcolorauto turned on. To turn off, do \"tarcolorauto off\"."
        tar() {
            case "$1" in
                *tvf*)   command tar "$@" | tarcolor ;;
                *)       command tar "$@" ;;
            esac
        }
    elif [ "$1" = "deactivate" -o "$1" = "off" ]; then
        unset -f tar
        echo "tarcolorauto turned off."
    fi
}
