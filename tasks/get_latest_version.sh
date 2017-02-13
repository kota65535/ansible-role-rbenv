#!/bin/sh

tmpdir=$(mktemp -d /tmp/XXXX)
git clone -q $1 ${tmpdir}
git clone -q $2 ${tmpdir}/plugins/ruby-build
export RBENV_ROOT=${tmpdir}
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(${RBENV_ROOT}/bin/rbenv init -)"

# Make regex pattern by replacing 'x' with \d
version_regex_str=$(echo "$3" | perl -pe 's/X/\\d+/g; s/\./\\./g')
# Consider patch number (exclude rc, dev, pre)
regex_str="^\s*${version_regex_str}(-p\d+)?$"
rbenv install -l | perl -nle "print if /${regex_str}/" | perl -e 'use Sort::Versions; print sort versions <STDIN>' | tail -n 1 | perl -pe 's/\s//g'
