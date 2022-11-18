#!/bin/bash 
set -e

#get latest tag matching given pattern and increment build number
if $(git rev-list $1-1..)
then
  latestTag=$(git describe --tags --abbrev=0 --match $1-*)
  tagComponents=(${latestTag//-/ })
  incrementedNumber=$((${tagComponents[1]}+1))
else
  incrementedNumber=$1-1
fi

#config git user as github bot
git config user.name "GitHub Actions Bot"
git config user.email "<>"

#add tag
git tag -a $1$incrementedNumber -m "Deployment $1$incrementedNumber"
git push origin --tags