import 'package:flutter/widgets.dart';

import 'package:hrk_batteries/hrk_batteries.dart';
import 'package:json_annotation/json_annotation.dart';

import 'locale_json_converter_2.dart';
import 'locale_list_json_converter.dart';

/// Locale list json converter for Non-nullable
///
/// See [LocaleListJsonConverter] for nullable
class LocaleListJsonConverter2
    implements JsonConverter<List<Locale>, List<dynamic>> {
  const LocaleListJsonConverter2();

  @override
  List<Locale> fromJson(List<dynamic> jsonList) {
    return jsonList.map((e) {
      return const LocaleJsonConverter2().fromJson(e);
    }).toList();
  }

  @override
  List<JsonMap> toJson(List<Locale> localeList) {
    return localeList.map((e) {
      return const LocaleJsonConverter2().toJson(e);
    }).toList();
  }
}
