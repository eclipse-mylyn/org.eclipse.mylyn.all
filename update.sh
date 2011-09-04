#!/bin/bash

echo > .commits.log
if [ "$1" == "-np" ]; then
 git submodule foreach 'git log $sha1.. >> ../.commits.log'
else
 git submodule foreach 'git pull && git log $sha1.. >> ../.commits.log'
fi

echo Update for integration build > .commits.msg
cat .commits.log | grep -E '^\s*(.*bug )?[0-9]+:' | sort -u >> .commits.msg

git commit -a -t .commits.msg
