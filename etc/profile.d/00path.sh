# Path ditectories

PATH=/bin:/sbin:/usr/bin:/usr/local/bin:/usr/games:/opt/bin:$HOME/bin
ROOTPATH=/sbin:/usr/sbin:/usr/local/sbin

if [ "`id -u`" -eq 0 ]; then
  PATH=$ROOTPATH:$PATH
fi

LD_LIBRARY_PATH=/usr/local/lib:/opt/lib

export PATH
export LD_LIBRARY_PATH
