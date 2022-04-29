import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> _popmenu_list = ["テスト", "ログアウト"];
    return AppBar(
        // leading: Icon(Icons.home),
        title: const Text('ページタイトル'),
        backgroundColor: Colors.white12,
        centerTitle: true,
        elevation: 0.0,
        automaticallyImplyLeading: false,

        // 右上メニューボタン
        actions: <Widget>[
          // overflow menu
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu),
            onSelected: (String s) {
              if (s == 'ログアウト') {
                FirebaseAuth.instance.signOut();

                Navigator.of(context).pushNamed("/signin");
                // Navigator.of(context).popUntil((route) => route.isFirst);
              }
            },
            itemBuilder: (BuildContext context) {
              return _popmenu_list.map((String s) {
                return PopupMenuItem(
                  child: Text(s),
                  value: s,
                );
              }).toList();
            },
          ),
        ],
      );
  }
}