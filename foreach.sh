#!/bin/sh
set -e
for i in org.eclipse.mylyn*; do
cd $i
echo Entering \'$i\'
$*
cd ..
done