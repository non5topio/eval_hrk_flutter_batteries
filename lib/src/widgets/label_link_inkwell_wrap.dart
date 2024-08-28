import 'package:flutter/material.dart';

import 'package:url_launcher/link.dart';

typedef PreFollowLink = Future<void> Function();
typedef CustomFollowLink = Future<void> Function();

/// A Widget which displays Label with URI Link.
///
/// The Link part offers native web experience with the help of [Link] widget
/// from the url_launcher package, like:
/// - Displaying URI on the bottom left in the Chrome when the cursor is
///   hovered on the URI
/// - Context menu on right-click
///
/// The Label and the Link part is wrapped when sufficient width is not
/// available, which helps in the widget not overflowing.
///
/// The Link part shows platform specific effect on interaction with the help of
/// [InkWell] widget.
class LabelLinkInkWellWrap extends StatelessWidget {
  const LabelLinkInkWellWrap({
    super.key,
    this.labelKey,
    required this.label,
    this.linkKey,
    required this.uri,
    this.preFollowLink,
    this.customFollowLink,
  });

  final Key? labelKey;
  final String label;
  final Key? linkKey;
  final Uri uri;

  /// Can be used for the Analytics usages before followLink or
  /// [customFollowLink]
  final PreFollowLink? preFollowLink;
  final CustomFollowLink? customFollowLink;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Text(
          '$label: ',
          key: labelKey,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        Link(
          key: linkKey,
          uri: uri,
          target: LinkTarget.blank,
          builder: (context, followLink) {
            return InkWell(
              onTap: () {
                preFollowLink?.call();
                if (customFollowLink != null) {
                  customFollowLink!.call();
                } else {
                  followLink?.call();
                }
              },
              child: Text(
                uri.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                    ),
              ),
            );
          },
        ),
      ],
    );
  }
}
