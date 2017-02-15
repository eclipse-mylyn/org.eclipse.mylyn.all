#/bin/bash

set -e -v

mvn -f org.eclipse.mylyn.docs clean verify -Dtycho.localArtifacts=ignore "$@"
mvn clean package -Pneon -Prelease -Dmaven.test.skip=true -Dexplicit-target=true "-DrootDirectory=$(pwd)" -Dtycho.localArtifacts=ignore "$@"
