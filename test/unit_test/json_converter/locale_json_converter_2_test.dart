import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
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

import 'dart/core';
    test('en', () {
      const locale = Locale('en');
      const JsonMap json = {'languageCode': 'en'};
      testConverter(locale, json);
    });
# FAILED TEST: **Short Analysis:**

The test file `locale_json_converter_2_test.dart` failed to compile due to incorrect usage of the `Locale` constructor with named parameters like `scriptCode`, which are not supported. The `Locale` class in Flutter only accepts positional parameters for `languageCode` and `countryCode`. The `scriptCode` must be provided using the `Locale.fromSubtags` constructor.

**Recommended Fix:**

Replace all incorrect `Locale(..., scriptCode: ...)` usages with `Locale.fromSubtags(languageCode: ..., scriptCode: ..., countryCode: ...)`. For example:

```dart
const locale = Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans');
```

    test('fromJson() with missing required languageCode field', () {
      final JsonMap json = {'scriptCode': 'Latn', 'countryCode': 'US'};
      expect(
        () => converter.fromJson(json),
        throwsA(isA<AssertionError>()),
      );
    });

# FAILED TEST: **Short Analysis:**

The test file `locale_json_converter_2_test.dart` failed to compile because it incorrectly uses the `Locale` constructor with a named parameter `scriptCode`, which is not supported. The `Locale` class in Flutter only accepts positional parameters for `languageCode` and `countryCode`. The `scriptCode` must be provided using the `Locale.fromSubtags` constructor.

**Recommended Fix:**

Update test cases using `Locale(..., scriptCode: ...)` to use `Locale.fromSubtags(languageCode: ..., scriptCode: ..., countryCode: ...)` instead. For example:

```dart
const locale = Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans');
```

    test('Locale with only languageCode and countryCode present', () {
      const locale = Locale('es', 'MX');
      const JsonMap json = {'languageCode': 'es', 'countryCode': 'MX'};
      testConverter(locale, json);
    });

# FAILED TEST: **Analysis:**

The test file `locale_json_converter_2_test.dart` failed to compile due to incorrect usage of the `Locale` constructor. Specifically, the test attempts to use a named parameter `scriptCode` in the `Locale` constructor, which is not supported. The `Locale` class in Flutter only accepts positional parameters for `languageCode` and `countryCode`. The `scriptCode` must be provided using the `Locale.fromSubtags` constructor.

**Recommended Fix:**

Update the failing test case to use `Locale.fromSubtags` instead of the standard `Locale` constructor when including a `scriptCode`:

```dart
test('Locale with all optional fields present', () {
  const locale = Locale.fromSubtags(languageCode: 'en', countryCode: 'US', scriptCode: 'Latn');
  const JsonMap json = {'languageCode': 'en', 'scriptCode': 'Latn', 'countryCode': 'US'};
  testConverter(locale, json);
});
```

This will align the test with the correct usage of the `Locale` class and resolve the compilation errors.

    test('Locale with only languageCode and scriptCode present', () {
      const locale = Locale('zh', 'Hans');
      const JsonMap json = {'languageCode': 'zh', 'scriptCode': 'Hans'};
      testConverter(locale, json);
    });

# FAILED TEST: The test failed because the `Locale` constructor does not accept a named parameter `scriptCode`. In Dart/Flutter, the `Locale` class only supports positional parameters for `languageCode` and `countryCode`, and does not have a named `scriptCode` parameter.

**Fix:**  
Replace the incorrect usage of `scriptCode` with the correct constructor syntax. To include a script code, use the `Locale.fromSubtags` constructor instead:

```dart
const locale = Locale.fromSubtags(languageCode: 'en', countryCode: 'US', scriptCode: 'Latn');
```

    test('Locale with all optional fields present', () {
      const locale = Locale('en', 'US', scriptCode: 'Latn');
      const JsonMap json = {'languageCode': 'en', 'scriptCode': 'Latn', 'countryCode': 'US'};
      testConverter(locale, json);
    });

  });
}
