import 'package:flutter/widgets.dart';

double getLargestTextWidth({
  required BuildContext context,
  required Set<String> textSet,
  TextStyle? style,
  TextScaler? textScaler,
}) {
  textScaler ??= TextScaler.linear(
    View.of(context).platformDispatcher.textScaleFactor,
  );
  double largestWidth = 0;
  for (final text in textSet) {
    final TextPainter textPainter = getTextPainterLaidout(
      context: context,
      text: text,
      style: style,
      textScaler: textScaler,
    );
    if (textPainter.size.width > largestWidth) {
      largestWidth = textPainter.size.width;
    }
  }
  return largestWidth;
}

TextPainter getTextPainterLaidout({
  required BuildContext context,
  required String text,
  TextStyle? style,
  TextScaler? textScaler,
}) {
  textScaler ??= TextScaler.linear(
    View.of(context).platformDispatcher.textScaleFactor,
  );
  final TextPainter textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    textDirection: TextDirection.ltr,
    textScaler: textScaler,
  );
  textPainter.layout();
  return textPainter;
}
