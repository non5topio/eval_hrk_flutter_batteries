import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';
import 'package:hrk_nasa_apis/hrk_nasa_apis.dart';
import 'package:intl/intl.dart';

import '../../widgets/app_bar.dart';
import '../settings/bloc/settings_bloc.dart';
import '../settings/bloc/settings_state.dart';

class DateRangeWidgetScreen extends StatefulWidget {
  const DateRangeWidgetScreen({
    super.key,
    required this.title,
    required this.l10n,
    this.routeExtraMap,
  });

  final String title;
  final AppLocalizations l10n;
  final JsonMap? routeExtraMap;
  static final DateTime firstDate = DateTime(1900, 1, 1);
  static final DateTime lastDate = DateTime(2200, 12, 31);
  static const String keyPrefix = 'date_range_widget_screen_';
  static const Key fillAllDatesKey = Key('${keyPrefix}fill_all_dates_key');
  static const Key customScrollViewKey = Key('${keyPrefix}scroll_view_key');
  static const String demoKeyPrefix = '${keyPrefix}demo_';
  static const String customDateTextDefault = '---';

  @override
  State<DateRangeWidgetScreen> createState() => _DateRangeWidgetScreenState();

  static String getDemoKeyPrefix(int index) {
    return '$demoKeyPrefix${index}_';
  }

  static Key getDemoKey(int index) {
    return Key('${getDemoKeyPrefix(index)}key');
  }
}

class _DateRangeWidgetScreenState extends State<DateRangeWidgetScreen> {
  late DateFormat dateFormat;
  DateTimeRange? demo0DateTimeRange;
  DateTimeRange? demo1DateTimeRange;
  DateTimeRange? demo2DateTimeRange;
  DateTimeRange? demo3DateTimeRange;
  DateTimeRange? demo4DateTimeRange;
  DateTimeRange? demo5DateTimeRange;
  DateTimeRange? demo6DateTimeRange;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) {
        return previous.dateFormatPattern != current.dateFormatPattern ||
            previous.locale != current.locale;
      },
      builder: (context, settingsState) {
        dateFormat = settingsState.getDateFormat();
        return Scaffold(
          body: _getBody(context: context),
          backgroundColor: Theme.of(context).colorScheme.surface,
        );
      },
    );
  }

  Widget _getBody({required BuildContext context}) {
    return CustomScrollView(
      key: DateRangeWidgetScreen.customScrollViewKey,
      controller: ScrollController(),
      slivers: [
        getSliverAppBar(
          context: context,
          title: Tooltip(
            message: widget.title,
            child: Text(widget.title),
          ),
          actions: getAppBarActions(context: context),
          floating: true,
          snap: true,
        ),
        ..._getSliverBody(context: context),
      ],
    );
  }

  List<Widget> getAppBarActions({required BuildContext context}) {
    return [
      IconButton(
        key: DateRangeWidgetScreen.fillAllDatesKey,
        tooltip: 'Fill All Dates',
        icon: const Icon(Icons.date_range),
        onPressed: () {
          setState(() {
            final DateTimeRange nowMonthDateTimeRange =
                HrkDateTimeRange.ofMonth();
            demo0DateTimeRange = nowMonthDateTimeRange;
            demo1DateTimeRange = nowMonthDateTimeRange;
            demo2DateTimeRange = nowMonthDateTimeRange;
            demo3DateTimeRange = nowMonthDateTimeRange;
            demo4DateTimeRange = nowMonthDateTimeRange;
            demo5DateTimeRange = nowMonthDateTimeRange;
            demo6DateTimeRange = nowMonthDateTimeRange;
          });
        },
      ),
      ...getDefaultAppBarActions(context: context),
    ];
  }

  List<Widget> _getSliverBody({required BuildContext context}) {
    return [
      const SliverPadding(
        padding: EdgeInsets.only(
          bottom: HrkDimensions.pageMarginVerticalHalf,
        ),
      ),
      _getDemo0(context: context),
      _getDemo1(context: context),
      _getDemo2(context: context),
      _getDemo3(context: context),
      _getDemo4(context: context),
      _getDemo5(context: context),
      _getDemo6(context: context),
      const SliverPadding(
        padding: EdgeInsets.only(
          bottom: HrkDimensions.pageMarginVerticalHalf,
        ),
      )
    ];
  }

  // Basic
  Widget _getDemo0({required BuildContext context}) {
    int demoIndex = 0;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: HrkDimensions.pageMarginHorizontal,
        vertical: HrkDimensions.pageMarginVerticalHalf,
      ),
      sliver: SliverToBoxAdapter(
        child: DateRangeWidget(
          key: DateRangeWidgetScreen.getDemoKey(demoIndex),
          keyPrefix: DateRangeWidgetScreen.getDemoKeyPrefix(demoIndex),
          startTitle: '${widget.l10n.startDate}:',
          endTitle: '${widget.l10n.endDate}:',
          dateRange: demo0DateTimeRange,
          firstDate: DateRangeWidgetScreen.firstDate,
          lastDate: DateRangeWidgetScreen.lastDate,
          dateFormat: dateFormat,
          selectButtonTitle: widget.l10n.selectDateRange,
          onDateRangeSelected: (dateTimeRange) {
            setState(() {
              demo0DateTimeRange = dateTimeRange;
            });
          },
        ),
      ),
    );
  }

  // title, dateTextDefault
  Widget _getDemo1({required BuildContext context}) {
    int demoIndex = 1;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: HrkDimensions.pageMarginHorizontal,
        vertical: HrkDimensions.pageMarginVerticalHalf,
      ),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: BodyItemContainer(
            child: DateRangeWidget(
              key: DateRangeWidgetScreen.getDemoKey(demoIndex),
              keyPrefix: DateRangeWidgetScreen.getDemoKeyPrefix(demoIndex),
              title: widget.l10n.demoIndex(demoIndex),
              startTitle: '${widget.l10n.startDate}:',
              endTitle: '${widget.l10n.endDate}:',
              dateRange: demo1DateTimeRange,
              firstDate: DateRangeWidgetScreen.firstDate,
              lastDate: DateRangeWidgetScreen.lastDate,
              dateFormat: dateFormat,
              startDateTextDefault: DateRangeWidgetScreen.customDateTextDefault,
              endDateTextDefault: DateRangeWidgetScreen.customDateTextDefault,
              selectButtonTitle: widget.l10n.selectDateRange,
              onDateRangeSelected: (dateTimeRange) {
                setState(() {
                  demo1DateTimeRange = dateTimeRange;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  // BodyItemContainer
  Widget _getDemo2({required BuildContext context}) {
    int demoIndex = 2;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: HrkDimensions.pageMarginHorizontal,
        vertical: HrkDimensions.pageMarginVerticalHalf,
      ),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: BodyItemContainer(
            child: DateRangeWidget(
              key: DateRangeWidgetScreen.getDemoKey(demoIndex),
              keyPrefix: DateRangeWidgetScreen.getDemoKeyPrefix(demoIndex),
              startTitle: '${widget.l10n.startDate}:',
              endTitle: '${widget.l10n.endDate}:',
              dateRange: demo2DateTimeRange,
              firstDate: DateRangeWidgetScreen.firstDate,
              lastDate: DateRangeWidgetScreen.lastDate,
              dateFormat: dateFormat,
              selectButtonTitle: widget.l10n.selectDateRange,
              onDateRangeSelected: (dateTimeRange) {
                setState(() {
                  demo2DateTimeRange = dateTimeRange;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  // startEndAlign
  Widget _getDemo3({required BuildContext context}) {
    int demoIndex = 3;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: HrkDimensions.pageMarginHorizontal,
        vertical: HrkDimensions.pageMarginVerticalHalf,
      ),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: BodyItemContainer(
            child: DateRangeWidget(
              key: DateRangeWidgetScreen.getDemoKey(demoIndex),
              keyPrefix: DateRangeWidgetScreen.getDemoKeyPrefix(demoIndex),
              title: widget.l10n.demoIndex(demoIndex),
              startTitle: '${widget.l10n.startDate}:',
              endTitle: '${widget.l10n.endDate}:',
              dateRange: demo3DateTimeRange,
              firstDate: DateRangeWidgetScreen.firstDate,
              lastDate: DateRangeWidgetScreen.lastDate,
              dateFormat: dateFormat,
              selectButtonTitle: widget.l10n.selectDateRange,
              startEndAlign: true,
              onDateRangeSelected: (dateTimeRange) {
                setState(() {
                  demo3DateTimeRange = dateTimeRange;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  // expectNoOverflow
  Widget _getDemo4({required BuildContext context}) {
    int demoIndex = 4;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: HrkDimensions.pageMarginHorizontal,
        vertical: HrkDimensions.pageMarginVerticalHalf,
      ),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: SizedBox(
            width: DeviceDimensions.galaxyFoldPortraitWidth -
                (HrkDimensions.pageMarginHorizontal * 2),
            child: BodyItemContainer(
              child: DateRangeWidget(
                key: DateRangeWidgetScreen.getDemoKey(demoIndex),
                keyPrefix: DateRangeWidgetScreen.getDemoKeyPrefix(demoIndex),
                title: widget.l10n.demoIndex(demoIndex),
                startTitle: '${widget.l10n.startDate}:',
                endTitle: '${widget.l10n.endDate}:',
                dateRange: demo4DateTimeRange,
                firstDate: DateRangeWidgetScreen.firstDate,
                lastDate: DateRangeWidgetScreen.lastDate,
                dateFormat: dateFormat,
                selectButtonTitle: widget.l10n.selectDateRange,
                onDateRangeSelected: (dateTimeRange) {
                  setState(() {
                    demo4DateTimeRange = dateTimeRange;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Disabled
  Widget _getDemo5({required BuildContext context}) {
    int demoIndex = 5;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: HrkDimensions.pageMarginHorizontal,
        vertical: HrkDimensions.pageMarginVerticalHalf,
      ),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: BodyItemContainer(
            child: DateRangeWidget(
              key: DateRangeWidgetScreen.getDemoKey(demoIndex),
              keyPrefix: DateRangeWidgetScreen.getDemoKeyPrefix(demoIndex),
              title: widget.l10n.demoIndex(demoIndex),
              startTitle: '${widget.l10n.startDate}:',
              endTitle: '${widget.l10n.endDate}:',
              dateRange: demo5DateTimeRange,
              firstDate: DateRangeWidgetScreen.firstDate,
              lastDate: DateRangeWidgetScreen.lastDate,
              dateFormat: dateFormat,
              selectButtonTitle: widget.l10n.selectDateRange,
              enabled: false,
              onDateRangeSelected: (dateTimeRange) {
                setState(() {
                  demo5DateTimeRange = dateTimeRange;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  // disableInputs
  Widget _getDemo6({required BuildContext context}) {
    int demoIndex = 6;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: HrkDimensions.pageMarginHorizontal,
        vertical: HrkDimensions.pageMarginVerticalHalf,
      ),
      sliver: SliverToBoxAdapter(
        child: Center(
          child: BodyItemContainer(
            child: DateRangeWidget(
              key: DateRangeWidgetScreen.getDemoKey(demoIndex),
              keyPrefix: DateRangeWidgetScreen.getDemoKeyPrefix(demoIndex),
              title: widget.l10n.demoIndex(demoIndex),
              startTitle: '${widget.l10n.startDate}:',
              endTitle: '${widget.l10n.endDate}:',
              dateRange: demo6DateTimeRange,
              firstDate: DateRangeWidgetScreen.firstDate,
              lastDate: DateRangeWidgetScreen.lastDate,
              dateFormat: dateFormat,
              selectButtonTitle: widget.l10n.selectDateRange,
              disableInputs: true,
              onDateRangeSelected: (dateTimeRange) {
                setState(() {
                  demo6DateTimeRange = dateTimeRange;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
