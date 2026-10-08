#! /usr/bin/env bash

## author: torstein

set -o errexit
set -o nounset
set -o pipefail

print_header() {
  cat <<EOF
<html>
  <head>
    <meta name="author" content="Torstein Krause Johansen"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <style>
      body {
        font-family: monospace;
      }
      h1 {
        font-size: 1em;
        text-align: justify;
        font-weight: normal;
      }
      h1:after {
        content: "";
        display: inline-block;
        width: 100%;
      }
      dt, p, li {
        margin-left: 5em;
      }
      dd {
        margin-left: 8em;
      }
    </style>
  </head>
  <body>
EOF
}

print_footer() {
  cat <<EOF
  </body>
</html>
EOF
}

md2html() {
  local _cwd=$1

  print_header
  md="${_cwd}"/$(basename "${0}" .sh).md
  cat "${md}" |
    LC_ALL=en_GB.UTF-8 sed -r \
        -e 's#(https://.*)#<a href="\1">\1</a>#' \
        -e 's~^## (.*)~<h2>\1</h2>~' \
        -e 's~^#(.*)~<h1>\1</h1>~' \
        -e 's~^— (.*)~<li>\1</li>~' \
        -e 's~^([A-Z].*)~<p>\1</p>~' \
        -e 's~^(skybert .*)~<p>\1</p>~' \
        -e 's#^(--[a-z]+) (.*)#<dt>\1</dt><dd>\2</dd>#' \
        -e 's#FOO-NOOP#BAR#'
  print_footer
}


main() {
  local _cwd=
  _cwd="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

  md2html "${_cwd}" | xmllint --pretty 1 - > "${_cwd}"/cv.html

  if test -x /opt/homebrew/bin/gsed; then
    gsed -i 's#<?xml version="1.0"?>#<!doctype html>#' "${_cwd}/cv.html"
  else
    sed -i 's#<?xml version="1.0"?>#<!doctype html>#' "${_cwd}/cv.html"
  fi
}

main "$@"
