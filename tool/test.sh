#!/usr/bin/env bash

set -e -o pipefail

flutter test --coverage
lcov --list coverage/lcov.info \
  | grep -v ".*|.*100%.*|.*|"
