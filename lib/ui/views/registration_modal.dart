import 'package:allergy/l10n/l10n.dart';
import 'package:flutter/material.dart';
import '../../const/allergies.dart';

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
            body: ListView.builder(
              itemCount: Allergies.list.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black38),
                      ),
                    ),
                    child: ListTile(
                      leading: Text('$index'),
                      title: Text(Allergies.list[index].name.ja),
                      onTap: () {/* react to the tile being tapped */},
                    ));
              },
            )));
  }
}
