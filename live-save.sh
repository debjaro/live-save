#!/bin/bash
is_file_avaiable(){
    disktmp=$(mktemp)
    rm -f $disktmp
    mkdir -p $disktmp || true
    timeout 10 mount -t auto "$1" $disktmp &>/dev/null
    [ -f "$disktmp/$2" ] && [ -b "$1" ]
    status=$?
    umount -lf $disktmp 2>/dev/null
    return $status
}

list=$(ls /sys/class/block/ | grep ".*[0-9]$" | grep -v loop | grep -v ram | grep -v nbd | sed "s|^|/dev/|g")
for part in $list
do
	sleep 0.1
	echo "Search: ${part}"
	if is_file_avaiable "$part" "/mount-me"
	then
		echo "Found: ${part}"
		mkdir /tmp/disk
		mount "${part}" /tmp/disk
		mountpoint=$(cat /tmp/disk/mount-me)
		umount -lf /tmp/disk
		rmdir /tmp/disk
		if [ -d "${mountpoint}" ] ; then
			mount "$part" "${mountpoint}"
		fi
	fi
done
