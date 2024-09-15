class HrkDimensions {
  static const double pageMargin = 16;
  static const double pageMarginHorizontal = 16;
  static const double pageMarginVertical = 16;
  static const double pageMarginHorizontalHalf = pageMarginHorizontal / 2;
  static const double pageMarginVerticalHalf = pageMarginVertical / 2;

  static const double bodyItemMargin = 8;
  static const double bodyItemPadding = 16;
  static const double bodyItemSpacing = 8;

  // avgMobileWidth - (2×pageMarginHorizontalHalf) - (2×bodyItemMargin)
  // 360 - (2×8) - (2×8)
  static const double bodyItemWidth = 328;
  static const double bodyItemBoxWidth = bodyItemWidth + 2 * bodyItemMargin;
  static const double bodyItemBorderWidth = 1;
  static const double bodyItemContentWidth =
      bodyItemWidth - (2 * bodyItemBorderWidth) - (2 * bodyItemPadding);

  // TODO(hrishikesh-kadam): Fix border issue
  // (avgMobileWidth - (4×bodyItemPadding) - (4×bodyItemMargin) - (2×pageMarginHorizontalHalf)) / 2
  // (360 − (4×16) − (4×8) − (2×8)) / 2
  static const double gridItemContentSize = 124;
  static const double gridItemWidth = gridItemContentSize + 2 * bodyItemPadding;
  static const double gridItemBoxWidth = gridItemWidth + 2 * bodyItemMargin;

  static const double containerRadius = 12;
}
