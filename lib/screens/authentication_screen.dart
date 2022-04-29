// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import '../utils/authenication_error.dart';
import '../utils/registration.dart';
import '../screens/home_screen.dart';
import '../utils/email_check.dart';

class Authentication extends StatefulWidget {
  @override
  _Authentication createState() => _Authentication();
}

class _Authentication extends State<Authentication> {
  String _signin_Email = ""; // 入力されたメールアドレス
  String _signin_Password = ""; // 入力されたパスワード
  String _infoText = ""; // ログインに関する情報を表示

  // エラーメッセージを日本語化するためのクラス
  final auth_error = AuthenticationError();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // メールアドレスの入力フォーム
            Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
                child: TextFormField(
                  decoration: const InputDecoration(labelText: "メールアドレス"),
                  onChanged: (String value) {
                    _signin_Email = value;
                  },
                )),

            // パスワードの入力フォーム
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 10.0),
              child: TextFormField(
                maxLengthEnforcement: MaxLengthEnforcement.none, decoration: const InputDecoration(labelText: "パスワード（8～20文字）"),
                obscureText: true, // パスワードが見えないようRにする
                maxLength: 20, // 入力可能な文字数の制限を超える場合の挙動の制御
                onChanged: (String value) {
                  _signin_Password = value;
                },
              ),
            ),

            // ログイン失敗時のエラーメッセージ
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 5.0),
              child: Text(
                _infoText,
                style: const TextStyle(color: Colors.red),
              ),
            ),

            // ログインボタンの配置
            SizedBox(
              width: 350.0,
              // height: 100.0,
              child: ElevatedButton(
                // ボタンの形状や背景色など
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // background-color
                  onPrimary: Colors.white, //text-color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                // ボタン内の文字と書式
                child: const Text(
                  'ログイン',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                onPressed: () async {
                  try {
                    // メール/パスワードでログイン
                    UserCredential _result =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: _signin_Email,
                      password: _signin_Password,
                    );

                    // ログイン成功
                    User? _user = _result.user; // ログインユーザーのIDを取得

                    // Email確認が済んでいる場合のみHome画面へ
                    if (_user != null && _user.emailVerified) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ));
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Emailcheck(
                                email: _signin_Email,
                                pswd: _signin_Password,
                                from: 2)),
                      );
                    }
                  } catch (e) {
                    // ログインに失敗した場合
                    setState(() {
                      _infoText =
                          auth_error.signin_error_msg(e.hashCode, e.toString());
                    });
                  }
                },
              ),
            ),

            // ログイン失敗時のエラーメッセージ
            TextButton(
              child: const Text('上記メールアドレスにパスワード再設定メールを送信'),
              onPressed: () => FirebaseAuth.instance
                  .sendPasswordResetEmail(email: _signin_Email),
            ),
          ],
        ),
      ),

      // 画面下にアカウント作成画面への遷移ボタンを配置
      bottomNavigationBar:
          Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: 350.0,
            // height: 100.0,
            child: ElevatedButton(
                // ボタンの形状や背景色など
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[50], // background-color
                  onPrimary: Colors.blue, //text-color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'アカウントを作成する',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                // ボタンクリック後にアカウント作成用の画面の遷移する。
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      fullscreenDialog: true,
                      builder: (BuildContext context) => Registration(),
                    ),
                  );
                }),
          ),
        ),
      ]),
    );
  }
}