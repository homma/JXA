#!/bin/sh

# author:Daisuke Homma

DATE=`date '+%Y/%m/%d %H:%M'`
MESSAGE="committed on ${DATE}."

if [ $# -eq 1 ]; then MESSAGE=$1; fi

git pull
git checkout master
git add .
git commit -a -m "${MESSAGE}"
git push origin master

