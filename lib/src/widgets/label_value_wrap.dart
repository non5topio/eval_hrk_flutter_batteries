import 'package:flutter/material.dart';

import '../helper/text_helper.dart';

class LabelValueWrap extends StatelessWidget {
  const LabelValueWrap({
    super.key,
    this.keyPrefix = defaultKeyPrefix,
    required this.label,
    required this.value,
    this.spacing = 0,
    this.textStyle,
  });

  final String keyPrefix;
  final String label;
  final String value;
  final double spacing;
  final TextStyle? textStyle;

  Key get labelKey => Key('${keyPrefix}label_key');
  Key get valueKey => Key('${keyPrefix}value_key');

  static const String defaultKeyPrefix = 'label_value_wrap_';

  @override
  Widget build(BuildContext context) {
    final textStyle = this.textStyle ?? Theme.of(context).textTheme.bodyMedium;
    final labelWidth = getTextPainterLaidout(
      context: context,
      text: label,
      style: textStyle,
    ).width;
    final valueWidth = getTextPainterLaidout(
      context: context,
      text: value,
      style: textStyle,
    ).width;
    return LayoutBuilder(
      builder: (context, constraints) {
        final double constrainWidth = constraints.constrainWidth();
        if (constrainWidth >= labelWidth + valueWidth + spacing) {
          return Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: spacing,
            children: [
              Text(
                label,
                key: labelKey,
                style: textStyle,
              ),
              Text(
                value,
                key: valueKey,
                style: textStyle,
              ),
            ],
          );
        } else {
          return Column(
            children: [
              SizedBox(
                width: constrainWidth,
                child: Text(
                  label,
                  key: labelKey,
                  style: textStyle,
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                width: constrainWidth,
                child: Text(
                  value,
                  key: valueKey,
                  style: textStyle,
                  textAlign: TextAlign.end,
                ),
              )
            ],
          );
        }
      },
    );
  }
}
