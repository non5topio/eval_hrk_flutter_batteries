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

  static Key getDemoScaffoldKey(int index) {
    return Key('${getDemoKeyPrefix(index)}_scaffold_key');
  }

  static Key getDemoHeaderKey(int index) {
    return Key('${getDemoKeyPrefix(index)}_header_key');
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
    int demoIndex = 0;
    return [
      const SliverPadding(
        padding: EdgeInsets.only(
          bottom: HrkDimensions.pageMarginVerticalHalf,
        ),
      ),
      _getDemo0(context: context, demoIndex: demoIndex++),
      _getDemo1(context: context, demoIndex: demoIndex++),
      _getDemo2(context: context, demoIndex: demoIndex++),
      _getDemo3(context: context, demoIndex: demoIndex++),
      _getDemo4(context: context, demoIndex: demoIndex++),
      _getDemo5(context: context, demoIndex: demoIndex++),
      _getDemo6(context: context, demoIndex: demoIndex++),
      const SliverPadding(
        padding: EdgeInsets.only(
          bottom: HrkDimensions.pageMarginVerticalHalf,
        ),
      )
    ];
  }

  Widget _getDemoScaffold({
    required BuildContext context,
    required int demoIndex,
    required String demoHeader,
    required Widget demoWidget,
  }) {
    return SliverPadding(
      key: DateRangeWidgetScreen.getDemoScaffoldKey(demoIndex),
      padding: const EdgeInsets.symmetric(
        horizontal: HrkDimensions.pageMarginHorizontal,
        vertical: HrkDimensions.pageMarginVerticalHalf,
      ),
      sliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Text(
              demoHeader,
              key: DateRangeWidgetScreen.getDemoHeaderKey(demoIndex),
              style: _getDemoHeaderTextStyle(context: context),
            ),
            const SizedBox(height: HrkDimensions.bodyItemSpacing),
            demoWidget,
          ],
        ),
      ),
    );
  }

  TextStyle _getDemoHeaderTextStyle({required BuildContext context}) {
    final theme = Theme.of(context);
    return theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.tertiary,
    );
  }

  Widget _getDemo0({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'Basic',
      demoWidget: DateRangeWidget(
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
    );
  }

  Widget _getDemo1({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'title, dateTextDefault',
      demoWidget: BodyItemContainer(
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
    );
  }

  Widget _getDemo2({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'BodyItemContainer',
      demoWidget: BodyItemContainer(
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
    );
  }

  Widget _getDemo3({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'startEndAlign',
      demoWidget: BodyItemContainer(
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
    );
  }

  Widget _getDemo4({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'expectNoOverflow()',
      demoWidget: SizedBox(
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
    );
  }

  Widget _getDemo5({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'Disabled',
      demoWidget: BodyItemContainer(
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
    );
  }

  Widget _getDemo6({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'disableInputs',
      demoWidget: BodyItemContainer(
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
    );
  }
}
