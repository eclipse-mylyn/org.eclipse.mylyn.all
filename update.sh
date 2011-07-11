#!/bin/bash
echo -e Update for integration build\\n\\n > .commits.log
git submodule foreach 'git pull && echo \\n=== $path ===\\n >> ../.commits.log && git log $sha1.. >> ../.commits.log'
git commit -a -t .commits.log
