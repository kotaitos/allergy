// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// [Themelist] インスタンスにおける処理。
class Home extends StatelessWidget {
  final String _uid =
      FirebaseAuth.instance.currentUser?.uid.toString() ?? 'ログインユーザー名取得失敗';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // メイン画面
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
            child: Text('ホーム画面',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        ]),
      ),
    );
  }
}
