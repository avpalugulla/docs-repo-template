#!/bin/bash -l

set -e
source /opt/rh/rh-git29/enable
bundle update
bundle exec jekyll build
bundle exec htmlproofer ./_site --http-status-ignore "999" --check-html --assume_extension --external_only
