import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:hrk_batteries/hrk_batteries.dart';

import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

void main() {
  group('$LocaleJsonConverter2 Unit Test', () {
    const converter = LocaleJsonConverter2();

    void testConverter(Locale locale, JsonMap json) {
      final JsonMap convertedJson = converter.toJson(locale);
      expect(convertedJson, json);
      final Locale roundTripLocale = converter.fromJson(convertedJson);
      expect(roundTripLocale, locale);
      final Locale convertedLocale = converter.fromJson(json);
      expect(convertedLocale, locale);
      final JsonMap roundTripJson = converter.toJson(convertedLocale);
      expect(roundTripJson, json);
    }

    test('en', () {
      const locale = Locale('en');
      const JsonMap json = {'languageCode': 'en'};
      testConverter(locale, json);
    });
  });
}
