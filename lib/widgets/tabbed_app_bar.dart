import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> _popmenu_list = ["テスト", "ログアウト"];
    return AppBar(
      // leading: Icon(Icons.home),
      title: const Text('allergy'),
      centerTitle: true,
      elevation: 0.0,
      automaticallyImplyLeading: false,
    );
  }
}
