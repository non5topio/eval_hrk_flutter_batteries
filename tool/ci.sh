#!/usr/bin/env bash

set -e -o pipefail

tool/create.sh

tool/format-analyze.sh

tool/test.sh

dart pub global activate pana
dart pub global run pana --no-warning

dart pub publish --dry-run

git diff --stat
git --no-pager diff
if flutter --version | grep -q "channel stable" &> /dev/null; then
  git diff --exit-code  --quiet \
    ':(exclude)playground_app/.metadata' \
    ':(exclude)*.mocks.dart'
fi
