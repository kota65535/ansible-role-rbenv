#!/bin/sh
tmpdir=$(mktemp -d)
git clone -q $1 ${tmpdir}
git clone -q $2 ${tmpdir}/plugins/ruby-build
export RBENV_ROOT=${tmpdir}
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(${RBENV_ROOT}/bin/rbenv init -)"

version_regex_str=$(echo "$3" | sed -e 's/x/[[:digit:]]/g' -e 's/\./\\./g')
# regex_str="^[[:space:]]+${version_regex_str}(?!-rc|-dev|-pre).*"
regex_str="^[[:space:]]+${version_regex_str}(-p[[:digit:]]+)?$"
rbenv install -l | grep -P "${regex_str}" | sort --version-sort | tail -n 1 | sed -e 's/[[:blank:]]//g'
