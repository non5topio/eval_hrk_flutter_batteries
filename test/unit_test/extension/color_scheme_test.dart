// ignore_for_file: avoid_print, directives_ordering

import 'package:flutter/material.dart';

import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

void main() {
  group('HrkColorScheme Unit Test', () {
    test('surfaceFixed', () {
      final seedColors = [
        HrkColors.flutterBlue,
        HrkColors.flutterNavy,
        HrkColors.flutterSky,
        ...Colors.primaries,
        ...Colors.accents,
      ];
      const double deltaPercent = 0.065;
      for (final seedColor in seedColors) {
        final colorSchemeLight = ColorScheme.fromSeed(
          seedColor: seedColor,
        );
        final colorSchemeDark = ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.dark,
        );

        check(colorSchemeLight.surfaceFixed.red).isCloseTo(
          colorSchemeDark.surfaceFixed.red,
          deltaPercent * 255,
        );
        check(colorSchemeLight.surfaceFixed.green).isCloseTo(
          colorSchemeDark.surfaceFixed.green,
          deltaPercent * 255,
        );
        check(colorSchemeLight.surfaceFixed.blue).isCloseTo(
          colorSchemeDark.surfaceFixed.blue,
          deltaPercent * 255,
        );
        final surfaceFixedHctLight =
            Hct.fromInt(colorSchemeLight.surfaceFixed.value);
        final surfaceFixedHctDark =
            Hct.fromInt(colorSchemeDark.surfaceFixed.value);
        check(surfaceFixedHctLight.hue).isCloseTo(
          surfaceFixedHctDark.hue,
          deltaPercent * 360,
        );
        // https://m3.material.io/styles/color/system/how-the-system-works#e4d1c787-e92f-4d6e-a757-cd6d5c3b298e
        check(surfaceFixedHctLight.chroma).isCloseTo(
          surfaceFixedHctDark.chroma,
          deltaPercent * 120,
        );
        check(surfaceFixedHctLight.tone).isCloseTo(
          surfaceFixedHctDark.tone,
          deltaPercent * 100,
        );
      }
    });

    test('surfaceFixed closeTo delta', () {
      final List<Color> seedColors = [
        HrkColors.flutterBlue,
        HrkColors.flutterNavy,
        HrkColors.flutterSky,
        ...Colors.primaries,
        ...Colors.accents,
      ];
      final List<num> redDeltaPercents = [];
      final List<num> greenDeltaPercents = [];
      final List<num> bluePercents = [];
      final List<num> huePercents = [];
      final List<num> chromaPercents = [];
      final List<num> tonePercents = [];
      for (final seedColor in seedColors) {
        final colorSchemeLight = ColorScheme.fromSeed(
          seedColor: seedColor,
        );
        final colorSchemeDark = ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.dark,
        );
        redDeltaPercents.add(
          (colorSchemeLight.surfaceFixed.red - colorSchemeDark.surfaceFixed.red)
                  .abs() /
              255,
        );
        greenDeltaPercents.add(
          (colorSchemeLight.surfaceFixed.green -
                      colorSchemeDark.surfaceFixed.green)
                  .abs() /
              255,
        );
        bluePercents.add(
          (colorSchemeLight.surfaceFixed.blue -
                      colorSchemeDark.surfaceFixed.blue)
                  .abs() /
              255,
        );
        final surfaceFixedHctLight =
            Hct.fromInt(colorSchemeLight.surfaceFixed.value);
        final surfaceFixedHctDark =
            Hct.fromInt(colorSchemeDark.surfaceFixed.value);
        huePercents.add(
          (surfaceFixedHctLight.hue - surfaceFixedHctDark.hue).abs() / 360,
        );
        chromaPercents.add(
          (surfaceFixedHctLight.chroma - surfaceFixedHctDark.chroma).abs() /
              360,
        );
        tonePercents.add(
          (surfaceFixedHctLight.tone - surfaceFixedHctDark.tone).abs() / 360,
        );
      }
      redDeltaPercents.sort();
      greenDeltaPercents.sort();
      bluePercents.sort();
      huePercents.sort();
      chromaPercents.sort();
      tonePercents.sort();
      print('redDeltaPercent max: ${redDeltaPercents.last.toStringAsFixed(5)}');
      print(
          'greenDeltaPercent max: ${greenDeltaPercents.last.toStringAsFixed(5)}');
      print('blueDeltaPercent max: ${bluePercents.last.toStringAsFixed(5)}');
      print('hueDeltaPercent max: ${huePercents.last.toStringAsFixed(5)}');
      print(
          'chromaDeltaPercent max: ${chromaPercents.last.toStringAsFixed(5)}');
      print('toneDeltaPercent max: ${tonePercents.last.toStringAsFixed(5)}');
      final List<num> maxDeltaPercents = [
        redDeltaPercents.last,
        greenDeltaPercents.last,
        bluePercents.last,
        huePercents.last,
        chromaPercents.last,
        tonePercents.last,
      ];
      maxDeltaPercents.sort();
      print('maxDeltaPercent max: ${maxDeltaPercents.last.toStringAsFixed(5)}');
    }, skip: true);
  });
}
