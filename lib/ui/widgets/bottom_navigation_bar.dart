import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/accounts_screen.dart';

class ButtomNavigationBar extends StatefulWidget {
  const ButtomNavigationBar({Key? key}) : super(key: key);

  @override
  State<ButtomNavigationBar> createState() => _ButtomNavigationBarState();
}

class _ButtomNavigationBarState extends State<ButtomNavigationBar> {
  int _selectedIndex = 0;
  final _pageWidgets = [
    HomeScreen(),
    AccountsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("allergy"),
        automaticallyImplyLeading: false,
      ),
      body: _pageWidgets.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home),
            label: 'Home',
            tooltip: "This is a Home Screen",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            activeIcon: Icon(Icons.account_box),
            label: 'Accounts',
            tooltip: "This is a Accounts Screen",
            backgroundColor: Colors.blue,
          ),
        ],

        // type: BottomNavigationBarType.shifting,
        // ここで色を設定していても、shiftingにしているので
        // Itemの方のbackgroundColorが勝ちます。
        // backgroundColor: Colors.red,
        enableFeedback: true,
        // IconTheme系統の値が優先されます。
        iconSize: 30,
        // 横向きレイアウトは省略します。
        // landscapeLayout: 省略
        selectedFontSize: 15,
        selectedIconTheme: const IconThemeData(size: 30),
        // selectedLabelStyle: const TextStyle(color: Colors.red),
        // ちなみに、LabelStyleとItemColorの両方を選択した場合、ItemColorが勝ちます。
        // selectedItemColor: Colors.black,
        unselectedFontSize: 15,
        unselectedIconTheme: const IconThemeData(size: 30),
        // unselectedLabelStyle: const TextStyle(color: Colors.purple),
        // IconTheme系統の値が優先されるのでこの値は適応されません。
        // unselectedItemColor: Colors.red,
      ),
    );
  }
}
