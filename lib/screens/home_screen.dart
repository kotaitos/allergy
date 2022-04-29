// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../res/costom_colors.dart';
import '../widgets/app_bar_title.dart';

// [Themelist] インスタンスにおける処理。
class Home extends StatelessWidget {
  final String _uid =
      FirebaseAuth.instance.currentUser?.uid.toString() ?? 'ログインユーザー名取得失敗';

  // 新規追加ダイアログ用の入力文字の受け取り用変数
  final _roomnameController = TextEditingController();

  // 共有コードダイアログ用の入力文字の受け取り用変数
  final _sharecodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const List<String> _popmenu_list = ["テスト", "ログアウト"];

    return Scaffold(
      // Header部分
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.firebaseNavy,
        title: const AppBarTitle(),
      ),

      // メイン画面
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
            child: Text(_uid,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                child: const Text('ボタン１'),

                // ボタン１の処理内容（ポップアップを出し、何かを入力させる。）
                onPressed: () async {
                  await showDialog(
                      context: context,
                      builder: (context) {
                        child:
                        return AlertDialog(
                          title: const Text('ダイアログ　タイトル'),
                          content: TextField(
                            //controller: dateTextController,
                            decoration: const InputDecoration(
                              hintText: '入力項目１',
                            ),
                            autofocus: true,
                            // keyboardType: TextInputType.number,
                            controller: _roomnameController,
                          ),
                          actions: <Widget>[
                            TextButton(
                                child: const Text('キャンセル'),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  print(_roomnameController);
                                }),
                          ],
                        );
                      });
                }),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
            child: Text('または'),
          ),
          SizedBox(
            width: 300.0,
            height: 40.0,
            child: ElevatedButton(
                // ボタンの形状や背景色など
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange, // background-color
                  onPrimary: Colors.white, //text-color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('ボタン２'),
                // ボタン２の処理内容（ポップアップを出し、何かを入力させる。）
                onPressed: () async {
                  await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('ダイアログ　タイトル'),
                          content: TextField(
                            //controller: dateTextController,
                            decoration: const InputDecoration(
                              hintText: '入力項目２',
                            ),
                            autofocus: true,
                            // keyboardType: TextInputType.number,
                            controller: _roomnameController,
                          ),
                          actions: <Widget>[
                            TextButton(
                                child: const Text('キャンセル'),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                            TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
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