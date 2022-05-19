import 'package:allergy/l10n/l10n.dart';
import 'package:flutter/material.dart';

class RegistrationModal extends StatelessWidget {
  const RegistrationModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = L10n.of(context)!;
    return Container(
        margin: const EdgeInsets.only(top: 64),
        decoration: const BoxDecoration(
          //モーダル自体の色
          color: Colors.white,
          //角丸にする
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Scaffold(
            appBar: AppBar(
              title: Text(l10n.views__registration_modal__title),
              centerTitle: true,
            ),
            body: SafeArea(
                child: Center(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                child: Text(l10n.views__registration_modal__title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ])))));
  }
}
