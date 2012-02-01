#!/bin/sh
for i in org.eclipse.mylyn*; do
cd $i
echo Entering \'$i\'
git status
cd ..
done