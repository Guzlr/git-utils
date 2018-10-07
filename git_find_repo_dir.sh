#!/bin/bash

set +x

until [ "$PWD" == "/" ] ; do
   if [ -e .git ] ; then
      echo $PWD
   fi
   cd ..
done
