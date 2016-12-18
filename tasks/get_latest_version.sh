#!/bin/sh
# Ensure this script runs in the become_user's home directory
cd ~
# Source rbenv initialization script
source $1
version_regex_str=$(echo "$2" | sed -e 's/x/[[:digit:]]/g' -e 's/\./\\./g')
# regex_str="^[[:space:]]+${version_regex_str}(?!-rc|-dev|-pre).*"
regex_str="^[[:space:]]+${version_regex_str}(-p[[:digit:]]+)?$"
rbenv install -l | grep -P "${regex_str}" | sort --version-sort | tail -n 1 | sed -e 's/[[:blank:]]//g'
