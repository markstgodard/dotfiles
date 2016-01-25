#!/bin/sh

if [ $# -lt 1 ]; then
  echo 1>&2 "$0: not enough arguments"
  exit 2
fi

echo "Updating $1 ..."

git add $1 && git ci -m "Update $1" && git push
