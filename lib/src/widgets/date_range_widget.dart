import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../constants/hrk_dimensions.dart';
import '../helper/text_helper.dart';

typedef DateRangeSelected = void Function(DateTimeRange? dateTimeRange);

enum DateRange {
  start,
  end,
}

/// Widget to select start and end date using [showDateRangePicker] and displays
/// them using [dateFormat]
class DateRangeWidget extends StatelessWidget {
  const DateRangeWidget({
    super.key,
    this.keyPrefix = defaultKeyPrefix,
    this.title,
    required this.startTitle,
    required this.endTitle,
    required this.dateRange,
    required this.firstDate,
    required this.lastDate,
    required this.dateFormat,
    this.startDateTextDefault = dateTextDefault,
    this.endDateTextDefault = dateTextDefault,
    required this.selectButtonTitle,
    this.enabled = true,
    this.disableInputs = false,
    this.spacing = HrkDimensions.bodyItemSpacing,
    this.startEndAlign = false,
    required this.onDateRangeSelected,
  });

  final String keyPrefix;
  final String? title;
  final String startTitle;
  final String endTitle;
  final DateTimeRange? dateRange;
  final DateTime firstDate;
  final DateTime lastDate;
  final DateFormat dateFormat;
  final String startDateTextDefault;
  final String endDateTextDefault;
  final String selectButtonTitle;
  final bool enabled;
  final bool disableInputs;
  final double spacing;
  final bool startEndAlign;
  final DateRangeSelected onDateRangeSelected;
  static const String defaultKeyPrefix = 'date_range_widget_';
  static const String defaultKey = '{$defaultKeyPrefix}key';
  static const String titleKey = 'title_key';
  static const String startLabelKey = 'start_label_key';
  static const String endLabelKey = 'end_label_key';
  static const String startDateKey = 'start_date_key';
  static const String endDateKey = 'end_date_key';
  static const String selectButtonKey = 'select_button_key';
  static const String dateTextDefault = '-';

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    List<String> formattedDateStringList = _getFormattedDateStringList();
    double? largestTextWidth = startEndAlign
        ? getLargestTextWidth(
            context: context,
            textSet: {
              startTitle,
              endTitle,
              ...formattedDateStringList.toSet(),
            },
            style: themeData.textTheme.bodyMedium,
          )
        : null;
    return Column(
      children: [
        if (title != null)
          Text(
            title!,
            key: Key('$keyPrefix$titleKey'),
            textAlign: TextAlign.center,
            style: themeData.textTheme.titleMedium,
          ),
        if (title != null) SizedBox(height: spacing),
        _getLabelDateWrap(
          context: context,
          dateRange: DateRange.start,
          largestTextWidth: largestTextWidth,
          formattedDateString: formattedDateStringList[0],
        ),
        SizedBox(height: spacing),
        _getLabelDateWrap(
          context: context,
          dateRange: DateRange.end,
          largestTextWidth: largestTextWidth,
          formattedDateString: formattedDateStringList[1],
        ),
        SizedBox(height: spacing),
        AbsorbPointer(
          absorbing: disableInputs,
          child: FilledButton.tonal(
            key: Key('$keyPrefix$selectButtonKey'),
            onPressed: enabled
                ? () {
                    _selectButtonOnPressed(context: context);
                  }
                : null,
            child: Text(
              selectButtonTitle,
              style: themeData.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }

  Widget _getLabelDateWrap({
    required BuildContext context,
    required DateRange dateRange,
    required double? largestTextWidth,
    required String formattedDateString,
  }) {
    return Wrap(
      spacing: spacing,
      runSpacing: spacing,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        SizedBox(
          width: largestTextWidth,
          child: Text(
            key: dateRange == DateRange.start
                ? Key('$keyPrefix$startLabelKey')
                : Key('$keyPrefix$endLabelKey'),
            dateRange == DateRange.start ? startTitle : endTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: startEndAlign ? TextAlign.end : null,
          ),
        ),
        SizedBox(
          width: largestTextWidth,
          child: Text(
            key: dateRange == DateRange.start
                ? Key('$keyPrefix$startDateKey')
                : Key('$keyPrefix$endDateKey'),
            formattedDateString,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: startEndAlign ? TextAlign.start : null,
          ),
        ),
      ],
    );
  }

  List<String> _getFormattedDateStringList() {
    final List<String> formattedDateSet = [];
    if (dateRange != null) {
      formattedDateSet.add(dateFormat.format(dateRange!.start));
      formattedDateSet.add(dateFormat.format(dateRange!.end));
    } else {
      formattedDateSet.add(startDateTextDefault);
      formattedDateSet.add(endDateTextDefault);
    }
    return formattedDateSet;
  }

  void _selectButtonOnPressed({
    required BuildContext context,
  }) async {
    final DateTimeRange? dateRange = await showDateRangePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    onDateRangeSelected(dateRange);
  }
}
