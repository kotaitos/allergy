import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/accounts_screen.dart';

class TabPage extends StatelessWidget {
  final _tab = <Tab>[
    Tab(text: 'Home', icon: Icon(Icons.home)),
    Tab(text: 'Accounts', icon: Icon(Icons.account_box)),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("allergy"),
          bottom: TabBar(
            tabs: _tab,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            HomeScreen(),
            Accounts(),
          ],
        ),
      ),
    );
  }
}
