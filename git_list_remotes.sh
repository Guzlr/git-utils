#!/bin/bash

REMOTE_SERVER=git-server
REMOTE_PATH=/git
REMOTE_ROOT=$REMOTE_SERVER:$REMOTE_PATH

# ---------------------------------------------------------------------------
#ssh $REMOTE_SERVER ls $REMOTE_PATH
ssh $REMOTE_SERVER du -h --max-depth=1 $REMOTE_PATH

