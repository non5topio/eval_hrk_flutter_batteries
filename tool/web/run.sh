#!/usr/bin/env bash

set -e -o pipefail

pushd playground_app &> /dev/null

flutter run -d chrome

popd &> /dev/null
