#!/bin/bash
LEECH=/home/leech

# rtorrent dirs
mkdir -p $LEECH/torrent/{complete,incomplete,queue,session,log}

# Handy symlinks
ln -s $LEECH/torrent/complete   $LEECH/c
ln -s $LEECH/torrent/incomplete $LEECH/i
ln -s $LEECH/torrent/queue      $LEECH/q

# Link dotfiles
if [ -f /home/avar/src/dotfiles/dotlink.pl ]; then
    HOME=/home/leech perl /home/avar/src/dotfiles/dotlink.pl
else
    echo "/home/avar/src/dotfiles/dotlink.pl doesn't exist, dotfiles not linked"
    exit 1
fi
    
