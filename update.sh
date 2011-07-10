#!/bin/bash
rm -f .commits.log
git submodule foreach 'git pull && echo \\n=== $path ===\\n >> ../.commits.log && git log $sha1.. >> ../.commits.log'
git commit -a -t .commits.log
