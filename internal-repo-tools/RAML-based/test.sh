#!/bin/sh

set -e
echo "enable git new"
source /opt/rh/rh-git29/enable
git branch -vv
npm install
mkdir docs/_build/html
for filename in *.raml; do
  output_html='$WORKSPACE/docs/_build/html/$filename.html'
  raml2html $filename > $output_html
done
