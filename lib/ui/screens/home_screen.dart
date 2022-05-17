import 'package:allergy/l10n/l10n.dart';
import 'package:allergy/ui/views/qr_scan_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qr_flutter/qr_flutter.dart';

// [Themelist] インスタンスにおける処理。
class HomeScreen extends StatelessWidget {
  final String _uid =
      FirebaseAuth.instance.currentUser?.uid.toString() ?? 'ログインユーザー名取得失敗';

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    return Scaffold(
      // メイン画面
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
            child: Text(l10n.ui__home__your_qr,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
            child: QrImage(
                data: 'https://www.kamo-it.org/blog/36/',
                version: QrVersions.auto,
                size: 200.0),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
            child: ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.qr_code_scanner),
                  Text('QRコードをスキャンする'),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.black,
                shape: const StadiumBorder(),
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
            child: ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.push_pin),
                  Text('アレルギーを登録する'),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue,
                onPrimary: Colors.black,
                shape: const StadiumBorder(),
              ),
              onPressed: () {},
            ),
          )
        ]),
      ),
    );
  }
}
