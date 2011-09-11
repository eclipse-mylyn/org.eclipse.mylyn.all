#!/bin/bash

echo > .commits.log
if [ "$1" == "-np" ]; then
 git submodule foreach 'git log $sha1.. >> ../.commits.log'
else
 git submodule foreach 'git pull && git log $sha1.. >> ../.commits.log'
fi

COUNT=$(grep Date: .commits.log -A 2 | sed -e '/^$/d' -e '/--/d' -e '/Date: /d' -e 's/^[ \t]*//' -e 's/^NEW - //' -e 's/^ASSIGNED - //' -e 's/^RESOLVED - //' | sort -u | wc -l)

echo Update for integration build \($COUNT changes\) > .commits.msg
grep Date: .commits.log -A 2 | sed -e '/^$/d' -e '/--/d' -e '/Date: /d' -e 's/^[ \t]*/ /' -e 's/^ NEW - / /' -e 's/^ ASSIGNED - / /' -e 's/^ RESOLVED - / /' | sort -u >> .commits.msg
#cat .commits.log | grep -E '^\s*(.*bug )?[0-9]+:' | sort -u >> .commits.msg

git commit -a -t .commits.msg
