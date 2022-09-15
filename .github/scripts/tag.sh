#!/bin/bash 
set -e

latestTag=$(git describe --tags --abbrev=0 --match $1*)
tagComponents=(${latestTag//-/ })
incrementedNumber=$((${tagComponents[1]}+1))
git tag -a $1$incrementedNumber -m "Deployment $1$incrementedNumber"