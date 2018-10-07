#!/bin/bash

REMOTE_SERVER=git-server.ad.cullingworth.net
REMOTE_PATH=/git
REMOTE_ROOT=$REMOTE_SERVER:$REMOTE_PATH

# ---------------------------------------------------------------------------
if [ "$1" != "remote" ] ; then

   if [ ! -d .git ] ; then
      echo "ERROR: Command must be run in the root directory of a git repo working copy"
      exit 1
   fi

   DIRECTORY=$(basename "$( cd $( dirname "${CWD}" ) >/dev/null && pwd )") 
   REPO=$(echo $DIRECTORY | sed -e "s/ /_/g").git

   # Copy this script to the git server then run it via ssh
   scp -o StrictHostKeyChecking=no $0 $REMOTE_SERVER:~
   ssh $REMOTE_SERVER ~/$(basename "$0") remote $REPO

   if [ $? -eq 0 ] ; then
      # Now add the remote repo as 'origin'
      git remote add -m master origin $REMOTE_ROOT/$REPO
      if [ $? -eq 0 ] ; then
         git push --set-upstream origin master
      fi
   fi
   exit $?

# ---------------------------------------------------------------------------
else
   # On the git server we create the bare repo if it doesn't already exist
   REPO=$2
   echo "Creating repo $REPO"
   if [ -e $REMOTE_PATH/$REPO ] ; then
      echo "ERROR: can't add remote repo '$REPO' - already exists"
      exit 1
   fi

   mkdir $REMOTE_PATH/$REPO
   cd $REMOTE_PATH/$REPO
   git init --bare --shared
   exit $?
fi
