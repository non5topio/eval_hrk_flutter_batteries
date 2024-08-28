#!/usr/bin/env bash

set -ex -o pipefail

dart format --output none --set-exit-if-changed .
dart run import_sorter:import_sorter --exit-if-changed
pushd playground_app &> /dev/null
dart run import_sorter:import_sorter --exit-if-changed
popd &> /dev/null

flutter analyze
