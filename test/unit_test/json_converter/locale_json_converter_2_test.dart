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

    test('mr_IN', () {
      const locale = Locale('mr', 'IN');
      const JsonMap json = {'languageCode': 'mr', 'countryCode': 'IN'};
      testConverter(locale, json);
    });

    test('hi-Deva-IN', () {
      const locale = Locale.fromSubtags(
        languageCode: 'hi',
        scriptCode: 'Deva',
        countryCode: 'IN',
      );
      const JsonMap json = {
        'languageCode': 'hi',
        'scriptCode': 'Deva',
        'countryCode': 'IN',
      };
      testConverter(locale, json);
    });

    test('dynamic', () {
      const locale = Locale.fromSubtags(
        languageCode: 'hi',
        scriptCode: 'Deva',
        countryCode: 'IN',
      );
      const dynamic json = {
        'languageCode': 'hi',
        'scriptCode': 'Deva',
        'countryCode': 'IN',
      };
      testConverter(locale, json);
    });

    // test('script injection in Locale', () {
    //   final Locale locale = Locale('<script>alert(1)</script>');
    //   final JsonMap json = converter.toJson(locale);
    //   expect(json['languageCode'], '<script>alert(1)</script>');
    // });


    // test('invalid types in JsonMap', () {
    //   final JsonMap json = {'languageCode': 123, 'countryCode': true};
    //   expect(() => converter.fromJson(json), throwsA(isA<TypeError>()));
    // });


    // test('Locale with maximum length strings', () {
    //   final String longString = 'a' * 100;
    //   final Locale locale = Locale.fromSubtags(
    //     languageCode: longString,
    //     scriptCode: longString,
    //     countryCode: longString,
    //   );
    //   final JsonMap json = converter.toJson(locale);
    //   expect(json['languageCode'], longString);
    //   expect(json['scriptCode'], longString);
    //   expect(json['countryCode'], longString);
    // });


    // test('injection attack via languageCode', () {
    //   final JsonMap json = {'languageCode': 'en; DROP TABLE users;', 'scriptCode': 'Latn', 'countryCode': 'US'};
    //   final Locale locale = converter.fromJson(json);
    //   expect(locale.languageCode, 'en; DROP TABLE users;');
    //   expect(locale.scriptCode, 'Latn');
    //   expect(locale.countryCode, 'US');
    // });


    // test('Locale with null scriptCode and countryCode', () {
    //   const locale = Locale.fromSubtags(languageCode: 'en', scriptCode: null, countryCode: null);
    //   final JsonMap json = converter.toJson(locale);
    //   expect(json['languageCode'], 'en');
    //   expect(json.containsKey('scriptCode'), isFalse);
    //   expect(json.containsKey('countryCode'), isFalse);
    // });


    // test('invalid types in JsonMap', () {
    //   final JsonMap json = {'languageCode': 123, 'scriptCode': true, 'countryCode': []};
    //   expect(() => converter.fromJson(json), throwsA(isA<TypeError>()));
    // });

    // test('special characters in all fields', () {
    //   final Locale locale = Locale.fromSubtags(
    //     languageCode: '!@#\$%',
    //     scriptCode: '&*()',
    //     countryCode: '{}[]',
    //   );
    //   final JsonMap json = converter.toJson(locale);
    //   expect(json['languageCode'], '!@#\$%');
    //   expect(json['scriptCode'], '&*()');
    //   expect(json['countryCode'], '{}[]');
      
    //   final Locale roundTripLocale = converter.fromJson(json);
    //   expect(roundTripLocale.languageCode, '!@#\$%');
    //   expect(roundTripLocale.scriptCode, '&*()');
    //   expect(roundTripLocale.countryCode, '{}[]');
    // });


    // test('missing languageCode in JSON', () {
    //   final JsonMap json = {'scriptCode': 'Latn', 'countryCode': 'US'};
    //   expect(() => converter.fromJson(json), throwsA(isA<TypeError>()));
    // });


    // test('Unicode characters in all fields', () {
    //   final Locale locale = Locale.fromSubtags(
    //     languageCode: '语言',
    //     scriptCode: '脚本',
    //     countryCode: '国家',
    //   );
    //   final JsonMap json = converter.toJson(locale);
    //   expect(json['languageCode'], '语言');
    //   expect(json['scriptCode'], '脚本');
    //   expect(json['countryCode'], '国家');
      
    //   final Locale roundTripLocale = converter.fromJson(json);
    //   expect(roundTripLocale.languageCode, '语言');
    //   expect(roundTripLocale.scriptCode, '脚本');
    //   expect(roundTripLocale.countryCode, '国家');
    // });


    // test('Locale with only countryCode', () {
    //   const locale = Locale.fromSubtags(
    //     languageCode: 'pt',
    //     countryCode: 'BR',
    //   );
    //   const JsonMap json = {'languageCode': 'pt', 'countryCode': 'BR'};
    //   testConverter(locale, json);
    // });


    // test('Locale with only scriptCode', () {
    //   const locale = Locale.fromSubtags(
    //     languageCode: 'zh',
    //     scriptCode: 'Hans',
    //   );
    //   const JsonMap json = {'languageCode': 'zh', 'scriptCode': 'Hans'};
    //   testConverter(locale, json);
    // });


    // test('additional unexpected keys in JSON', () {
    //   final JsonMap json = {
    //     'languageCode': 'en', 
    //     'scriptCode': 'Latn', 
    //     'countryCode': 'US', 
    //     'extraKey': 'value',
    //     'anotherExtraKey': 123
    //   };
    //   final Locale locale = converter.fromJson(json);
    //   expect(locale.languageCode, 'en');
    //   expect(locale.scriptCode, 'Latn');
    //   expect(locale.countryCode, 'US');
      
    //   // Verify the extra keys are ignored in the round trip
    //   final JsonMap roundTripJson = converter.toJson(locale);
    //   expect(roundTripJson.containsKey('extraKey'), isFalse);
    //   expect(roundTripJson.containsKey('anotherExtraKey'), isFalse);
    // });

  });
}
