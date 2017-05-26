#!/bin/sh

set -e
echo "enable git new"
source /opt/rh/rh-git29/enable
git branch -vv
bundle update
bundle exec jekyll build
bundle exec htmlproofer ./_site --http-status-ignore "999" --check-html --assume_extension --external_only
