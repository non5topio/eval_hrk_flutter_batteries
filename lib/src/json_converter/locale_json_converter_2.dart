import 'package:flutter/widgets.dart';

import 'package:hrk_batteries/hrk_batteries.dart';
import 'package:json_annotation/json_annotation.dart';

import 'locale_json_converter.dart';

/// Locale json converter for Non-nullable
///
/// See [LocaleJsonConverter] for nullable
class LocaleJsonConverter2 implements JsonConverter<Locale, JsonMap> {
  const LocaleJsonConverter2();

  @override
  Locale fromJson(JsonMap json) {
    return Locale.fromSubtags(
      languageCode: json['languageCode'],
      scriptCode: json['scriptCode'],
      countryCode: json['countryCode'],
    );
  }

  @override
  JsonMap toJson(Locale object) {
    JsonMap json = {};
    json['languageCode'] = object.languageCode;
    if (object.scriptCode != null) {
      json['scriptCode'] = object.scriptCode;
    }
    if (object.countryCode != null) {
      json['countryCode'] = object.countryCode;
    }
    return json;
  }
}
