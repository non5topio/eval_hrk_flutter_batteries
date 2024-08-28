#!/usr/bin/env bash

set -e -o pipefail

flutter create --template=package .

flutter pub upgrade

# For Golden File Test
# Keep checking for any better solution for updating icons
# https://github.com/flutter/flutter/wiki/Updating-Material-Design-Fonts-&-Icons
# flutter create downloads assets of material_fonts if the directory is absent
cp "$FLUTTER_ROOT/bin/cache/artifacts/material_fonts/Roboto-Regular.ttf" \
  "playground_app/assets/fonts/Roboto/"
cp "$FLUTTER_ROOT/bin/cache/artifacts/material_fonts/MaterialIcons-Regular.otf" \
  "playground_app/assets/fonts/MaterialIcons/"

pushd playground_app &> /dev/null

flutter create . --org "dev.hrishikesh_kadam.flutter.hrk_flutter_batteries"

flutter pub upgrade

dart run build_runner build --delete-conflicting-outputs

popd &> /dev/null
