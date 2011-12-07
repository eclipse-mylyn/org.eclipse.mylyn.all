#!/bin/sh
for i in org.eclipse.mylyn*; do
cd $i
echo Entering \'$i\'
git pull
cd ..
done

cd org.eclipse.mylyn.context
git fetch --all
git merge origin/master
