import 'package:allergy/ui/views/qr_scan_modal.dart';
import 'package:flutter/material.dart';
import 'package:allergy/l10n/l10n.dart';

class QrScanButton extends StatelessWidget {
  const QrScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    return Center(
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.qr_code_scanner),
            Text(l10n.ui__home__scan_qr),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
          onPrimary: Colors.black,
          shape: const StadiumBorder(),
        ),
        onPressed: () {
          BuildContext mainContext = context;
          showModalBottomSheet(
            //モーダルの背景の色、透過
            backgroundColor: Colors.transparent,
            //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return QrScanModal();
            },
          );
        },
      ),
    );
  }
}
