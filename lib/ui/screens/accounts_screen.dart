import 'package:allergy/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widget/tabbed_app_bar.dart';

// [Themelist] インスタンスにおける処理。
class Accounts extends StatelessWidget {
  final String _uid =
      FirebaseAuth.instance.currentUser?.uid.toString() ?? 'ログインユーザー名取得失敗';

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    return Scaffold(
      // メイン画面
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
            child: Text(_uid,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            width: 300.0,
            height: 40.0,
            child: ElevatedButton(
                // ボタンの形状や背景色など
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // background-color
                  onPrimary: Colors.white, //text-color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(l10n.ui__accounts__button1),

                // ボタン１の処理内容（ポップアップを出し、何かを入力させる。）
                onPressed: () async {
                  await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(l10n.ui__accounts__popup1__to_logout),
                          actions: <Widget>[
                            TextButton(
                                child: Text(l10n.ui__accounts__popup1__cancel),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            TextButton(
                                child: Text(l10n.ui__accounts__popup1__ok),
                                onPressed: () {
                                  FirebaseAuth.instance.signOut();
                                  Navigator.of(context).pushNamed("/signin");
                                }),
                          ],
                        );
                      });
                }),
          ),
        ]),
      ),
    );
  }
}
