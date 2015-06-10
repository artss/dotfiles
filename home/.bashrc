source /etc/profile

case `tty` in 
    /dev/tty[1])
        echo -n "Starting X Window system"
        echo startx
    ;;
esac
