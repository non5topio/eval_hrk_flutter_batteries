// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsStateImpl _$$SettingsStateImplFromJson(Map<String, dynamic> json) =>
    _$SettingsStateImpl(
      themeData:
          const ThemeDataJsonConverter().fromJson(json['themeData'] as String?),
      locale: json['locale'] == null
          ? SettingsState.localeDefault
          : const LocaleJsonConverter()
              .fromJson(json['locale'] as Map<String, dynamic>?),
      systemLocales: const LocaleListJsonConverter()
          .fromJson(json['systemLocales'] as List?),
      resolvedLocale: json['resolvedLocale'] == null
          ? LocaleExt.en
          : const LocaleJsonConverter2()
              .fromJson(json['resolvedLocale'] as Map<String, dynamic>),
      dateFormatPattern: $enumDecodeNullable(
              _$DateFormatPatternEnumMap, json['dateFormatPattern']) ??
          SettingsState.dateFormatPatternDefault,
      timeFormatPattern: $enumDecodeNullable(
              _$TimeFormatPatternEnumMap, json['timeFormatPattern']) ??
          SettingsState.timeFormatPatternDefault,
      textDirection:
          $enumDecodeNullable(_$TextDirectionEnumMap, json['textDirection']) ??
              SettingsState.textDirectionDefault,
      distanceUnit: json['distanceUnit'] == null
          ? SettingsState.distanceUnitDefault
          : DistanceUnit.fromJson(json['distanceUnit'] as Map<String, dynamic>),
      velocityUnit: json['velocityUnit'] == null
          ? SettingsState.velocityUnitDefault
          : VelocityUnit.fromJson(json['velocityUnit'] as Map<String, dynamic>),
      diameterUnit: json['diameterUnit'] == null
          ? SettingsState.diameterUnitDefault
          : DistanceUnit.fromJson(json['diameterUnit'] as Map<String, dynamic>),
      isAnyDialogShown: json['isAnyDialogShown'] as bool?,
    );

Map<String, dynamic> _$$SettingsStateImplToJson(_$SettingsStateImpl instance) =>
    <String, dynamic>{
      'themeData': const ThemeDataJsonConverter().toJson(instance.themeData),
      'locale': const LocaleJsonConverter().toJson(instance.locale),
      'systemLocales':
          const LocaleListJsonConverter().toJson(instance.systemLocales),
      'resolvedLocale':
          const LocaleJsonConverter2().toJson(instance.resolvedLocale),
      'dateFormatPattern':
          _$DateFormatPatternEnumMap[instance.dateFormatPattern]!,
      'timeFormatPattern':
          _$TimeFormatPatternEnumMap[instance.timeFormatPattern]!,
      'textDirection': _$TextDirectionEnumMap[instance.textDirection],
      'distanceUnit': instance.distanceUnit.toJson(),
      'velocityUnit': instance.velocityUnit.toJson(),
      'diameterUnit': instance.diameterUnit.toJson(),
      'isAnyDialogShown': instance.isAnyDialogShown,
    };

const _$DateFormatPatternEnumMap = {
  DateFormatPattern.yMd: 'yMd',
  DateFormatPattern.ddMMyyyySlash: 'dd/MM/yyyy',
  DateFormatPattern.ddMMyyyyHyphen: 'dd-MM-yyyy',
  DateFormatPattern.MMddyyyySlash: 'MM/dd/yyyy',
  DateFormatPattern.MMddyyyyHyphen: 'MM-dd-yyyy',
  DateFormatPattern.yyyyMMddSlash: 'yyyy/MM/dd',
  DateFormatPattern.yyyyMMddHyphen: 'yyyy-MM-dd',
  DateFormatPattern.yyyyMMMddHyphen: 'yyyy-MMM-dd',
};

const _$TimeFormatPatternEnumMap = {
  TimeFormatPattern.jm: 'jm',
  TimeFormatPattern.twelveHourClock: 'h:mm a',
  TimeFormatPattern.twentyFourHourClock: 'HH:mm',
};

const _$TextDirectionEnumMap = {
  TextDirection.rtl: 'rtl',
  TextDirection.ltr: 'ltr',
};
