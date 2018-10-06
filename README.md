# git-utils
Basic bash utilities for using git with a basic git server on my LAN

## git_push_to_create.sh
A tool to create a remote repo from a local-only repo and push it to the remote. 
Then git push/pull will work without further faffing around.

Assumptions:
  * The user has ssh access to the remote git server - ideally key-based login.
  * The remote user has write access to the remote directory containing the repos.

I use this script push repos to a server to allow sharing them between various machines on my LAN.
