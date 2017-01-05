#!/bin/sh
tmpdir=$(mktemp -d /tmp/XXXX)
git clone -q $1 ${tmpdir}
git clone -q $2 ${tmpdir}/plugins/ruby-build
export RBENV_ROOT=${tmpdir}
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(${RBENV_ROOT}/bin/rbenv init -)"

version_regex_str=$(echo "$3" | perl -pe 's/(?<!rb)x/[[:digit:]]+/g; s/\./\\./g')
# regex_str="^[[:space:]]+${version_regex_str}(?!-rc|-dev|-pre).*"
regex_str="^[[:space:]]+${version_regex_str}(-p[[:digit:]]+)?$"
rbenv install -l | perl -nlE "say if /${regex_str}/" | php -r '$a=array_map("trim",file("php://stdin"));usort($a,"version_compare");echo(join("\n",$a))."\n";' | tail -n 1 | sed -e 's/[[:blank:]]//g'

