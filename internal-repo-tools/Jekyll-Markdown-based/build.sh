#!/bin/sh

set -e
source /opt/rh/rh-git29/enable
bundle update
bundle exec jekyll build
