import 'package:allergy/l10n/l10n.dart';
import 'package:allergy/ui/views/share_modal.dart';
import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    return Center(
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.share),
            Text(l10n.ui__home__share),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.lightBlue,
          onPrimary: Colors.black,
          shape: const StadiumBorder(),
        ),
        onPressed: () {
          showModalBottomSheet(
            //モーダルの背景の色、透過
            backgroundColor: Colors.white,
            //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const ShareModal();
            },
          );
        },
      ),
    );
  }
}
