// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hrk_batteries/hrk_batteries.dart';
import 'package:hrk_flutter_batteries/hrk_flutter_batteries.dart';

import '../../constants/constants.dart';
import '../../widgets/app_bar.dart';

class LabelLinkInkWellWrapScreen extends StatelessWidget {
  const LabelLinkInkWellWrapScreen({
    super.key,
    required this.title,
    required this.l10n,
    this.routeExtraMap,
  });

  final String title;
  final AppLocalizations l10n;
  final JsonMap? routeExtraMap;
  static const String keyPrefix = 'label_link_inkwell_wrap_screen_';
  static const Key listViewKey = Key('${keyPrefix}list_view_key');
  static const String demoKeyPrefix = '${keyPrefix}demo_';

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

  static Key getDemoLabelKey(int index) {
    return Key('${getDemoKeyPrefix(index)}label_key');
  }

  static Key getDemoLinkKey(int index) {
    return Key('${getDemoKeyPrefix(index)}link_key');
  }

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: getAppBar(
          context: context,
          title: Tooltip(
            message: title,
            child: Text(title),
          ),
        ),
        body: _getBody(context: context),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }

  Widget _getBody({required BuildContext context}) {
    final scrollableContents = _getScrollableContents(context: context);
    return ListView.separated(
      key: listViewKey,
      itemCount: scrollableContents.length,
      itemBuilder: (context, index) {
        return scrollableContents[index];
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: HrkDimensions.bodyItemSpacing);
      },
      padding: const EdgeInsets.symmetric(
        vertical: HrkDimensions.pageMarginVertical,
        horizontal: HrkDimensions.pageMarginHorizontal,
      ),
    );
  }

  List<Widget> _getScrollableContents({required BuildContext context}) {
    int demoIndex = 0;
    return [
      _getDemo0(context: context, demoIndex: demoIndex++),
      _getDemo1(context: context, demoIndex: demoIndex++),
      _getDemo2(context: context, demoIndex: demoIndex++),
      _getDemo3(context: context, demoIndex: demoIndex++),
      _getDemo4(context: context, demoIndex: demoIndex++),
      _getDemo5(context: context, demoIndex: demoIndex++),
    ];
  }

  Widget _getDemoScaffold({
    required BuildContext context,
    required int demoIndex,
    required String demoHeader,
    required Widget demoWidget,
  }) {
    return Column(
      key: getDemoScaffoldKey(demoIndex),
      children: [
        Text(
          demoHeader,
          key: getDemoHeaderKey(demoIndex),
          style: _getDemoHeaderTextStyle(context: context),
        ),
        const SizedBox(height: HrkDimensions.bodyItemSpacing),
        demoWidget,
      ],
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
      demoWidget: LabelLinkInkWellWrap(
        key: getDemoKey(demoIndex),
        labelKey: getDemoLabelKey(demoIndex),
        label: l10n.source,
        uri: Constants.sourceRepoUrl,
        linkKey: getDemoLinkKey(demoIndex),
      ),
    );
  }

  Widget _getDemo1({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'Wrapped in two lines',
      demoWidget: Center(
        child: SizedBox(
          width: 400,
          child: LabelLinkInkWellWrap(
            key: getDemoKey(demoIndex),
            labelKey: getDemoLabelKey(demoIndex),
            label: l10n.source,
            uri: Constants.sourceRepoUrl,
            linkKey: getDemoLinkKey(demoIndex),
          ),
        ),
      ),
    );
  }

  Widget _getDemo2({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'Wrapped in three lines',
      demoWidget: Center(
        child: SizedBox(
          width: 350,
          child: LabelLinkInkWellWrap(
            key: getDemoKey(demoIndex),
            labelKey: getDemoLabelKey(demoIndex),
            label: l10n.source,
            uri: Constants.sourceRepoUrl,
            linkKey: getDemoLinkKey(demoIndex),
          ),
        ),
      ),
    );
  }

  Widget _getDemo3({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'preFollowLink',
      demoWidget: LabelLinkInkWellWrap(
        key: getDemoKey(demoIndex),
        labelKey: getDemoLabelKey(demoIndex),
        label: l10n.source,
        uri: Constants.sourceRepoUrl,
        linkKey: getDemoLinkKey(demoIndex),
        preFollowLink: () async {},
      ),
    );
  }

  Widget _getDemo4({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'customFollowLink',
      demoWidget: LabelLinkInkWellWrap(
        key: getDemoKey(demoIndex),
        labelKey: getDemoLabelKey(demoIndex),
        label: l10n.source,
        uri: Constants.sourceRepoUrl,
        linkKey: getDemoLinkKey(demoIndex),
        customFollowLink: () async {},
      ),
    );
  }

  Widget _getDemo5({required BuildContext context, required int demoIndex}) {
    return _getDemoScaffold(
      context: context,
      demoIndex: demoIndex,
      demoHeader: 'preFollowLink, customFollowLink',
      demoWidget: LabelLinkInkWellWrap(
        key: getDemoKey(demoIndex),
        labelKey: getDemoLabelKey(demoIndex),
        label: l10n.source,
        uri: Constants.sourceRepoUrl,
        linkKey: getDemoLinkKey(demoIndex),
        preFollowLink: () async {},
        customFollowLink: () async {},
      ),
    );
  }
}
