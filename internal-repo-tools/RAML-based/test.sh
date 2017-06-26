#!/bin/sh

set -e
echo "enable git new"
source /opt/rh/rh-git29/enable
source /opt/rh/rh-nodejs4/enable
echo $PATH
npm config set prefix /var/lib/jenkins/.npm-global
git branch -vv
npm install
mkdir -p $WORKSPACE/docs/_build/html/
for filename in *.raml; do
  base=$( basename $filename .raml )
  touch $WORKSPACE/docs/_build/html/${base}.html
  output_html=$WORKSPACE/docs/_build/html/${base}.html
  raml2html $filename > $output_html
done
