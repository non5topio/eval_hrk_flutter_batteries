#!/usr/bin/env bash

set -e -o pipefail

flutter clean

pushd playground_app &> /dev/null
flutter clean
popd &> /dev/null
