#!/bin/sh
rm -rf /github/workspace/image_thumbnails
python /thumbnails_readme_action.py
ls -laR /github/workspace