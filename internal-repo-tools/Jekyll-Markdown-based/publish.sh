#!/bin/sh

# Enable the newest verion available for git.
source /opt/rh/rh-git29/enable
# For debugging, check that the branches are both there.
git branch -vv
# Since GitHub Pages publishes straight Markdown without needing a
# build-to-HTML step, we just copy master to gh-pages when we're ready to
# publish.
git checkout gh-pages
git merge master -m "Test, build, and publish with Jenkins (build # $BUILD_NUMBER)"
git push origin gh-pages
