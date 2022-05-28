import 'package:flutter/material.dart';

Widget _menuItem(String title, Icon icon) {
  return GestureDetector(
    child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child: icon,
            ),
            Text(
              title,
              style: const TextStyle(color: Colors.black, fontSize: 18.0),
            ),
          ],
        )),
    onTap: () {
      print("onTap called.");
    },
  );
}
