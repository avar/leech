#!/bin/bash
LEECH="/home/leech"

# rtorrent dirs
mkdir -p $LEECH/torrent/{complete,incomplete,queue,session}

# Handy symlinks
ln -s $LEECH/torrent/complete   $LEECH/c
ln -s $LEECH/torrent/incomplete $LEECH/i
ln -s $LEECH/torrent/queue      $LEECH/q

# Link dotfiles
if type link-files >/dev/null; then
    link-files --source . --dest $LEECH -a setup.sh -a README.mkdn
else
    echo "Perl module File::Linkdir not installed; dotfiles not linked"
    exit 1
fi

