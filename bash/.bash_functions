
xcutpath() {
    if [ "x$1" == "x" ]; then
        echo "usage: xcutpath <filename>"
    else
        if [ -f "$1" ]; then
            readlink -f "$1" | tr -d "\n" | xsel -ib
        else
            echo "file $1 not found" >&1
        fi
    fi
}
