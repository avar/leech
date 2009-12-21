#!/bin/bash
LEECH="/home/leech"
RTOM="rtom-0.2.0-080619"
RTOM_FILE="$RTOM.tar.gz"
RTOM_URL="http://projects.cyla.homeip.net/rtwi/downloads/rtom/$RTOM_FILE"

# rtorrent dirs
mkdir -p $LEECH/torrent/{complete,incomplete,queue,session,log}

# Handy symlinks
ln -s $LEECH/torrent/complete   $LEECH/c
ln -s $LEECH/torrent/incomplete $LEECH/i
ln -s $LEECH/torrent/queue      $LEECH/q

# munin plugins to monitor rtorrent
wget -c -O /tmp/$RTOM_FILE $RTOM_URL
mkdir $LEECH/torrent/rtom
cd $LEECH/torrent/rtom
tar zxf /tmp/$RTOM_FILE
mv $RTOM rtom
cd -

# Link dotfiles
if type link-files >&/dev/null; then
    link-files --source . --dest $LEECH -a setup.sh -a README.mkdn
else
    echo "Perl module File::Linkdir not installed; dotfiles not linked"
    exit 1
fi

