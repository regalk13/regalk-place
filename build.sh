#!/bin/sh
# Copy css files to public folder
echo "Copying css files to public folder"
cp -r content/css public/

# Build site
emacs -Q --script build-site.el
