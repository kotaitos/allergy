import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';

class ShareModal extends StatelessWidget {
  const ShareModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    return Container(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.share),
              title: Text(l10n.widgets__share_button__share),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.link),
              title: Text(l10n.widgets__share_button__copy),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
