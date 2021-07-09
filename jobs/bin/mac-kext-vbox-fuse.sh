#!/bin/bash

function status() {
    kextstat | grep org.virtualbox.kext > /dev/null 2>&1 ;
    vbox=$((1-$?))
    kextstat | grep com.github.osxfuse > /dev/null 2>&1 ;
    fuse=$((1-$?))
}

status

if [ "$1" == "vbox" ] ; then
    if [ $vbox == 1 ] ; then
    echo "Already vbox"
    else
        sudo kextunload -b com.github.osxfuse.filesystems.osxfuse
        sudo kextutil "/Library/Application Support/VirtualBox/VBoxDrv.kext" -r "/Library/Application Support/VirtualBox"
        sudo kextutil "/Library/Application Support/VirtualBox/VBoxNetAdp.kext" -r "/Library/Application Support/VirtualBox"
        sudo kextutil "/Library/Application Support/VirtualBox/VBoxNetFlt.kext" -r "/Library/Application Support/VirtualBox"
        sudo kextutil "/Library/Application Support/VirtualBox/VBoxUSB.kext" -r "/Library/Application Support/VirtualBox"
    fi
elif [ "$1" == "fuse" ] ; then
    if [ $fuse == 1 ] ; then
    echo "Already fuse"
    else
        sudo kextunload -b org.virtualbox.kext.VBoxUSB -b org.virtualbox.kext.VBoxNetFlt -b org.virtualbox.kext.VBoxNetAdp
        sudo kextunload -b org.virtualbox.kext.VBoxDrv
        # sudo kextutil /Library/Filesystems/osxfuse.fs/Contents/Extensions/10.12/osxfuse.kext
        sudo kextutil /Library/Filesystems/macfuse.fs/Contents/Extensions/10.14/macfuse.kext
    fi
elif [ "$1" == "status" ] ; then
    echo "vbox = $vbox"
    echo "fuse = $fuse"
else
    echo "Run $0 <vbox|fuse|status>"
fi
