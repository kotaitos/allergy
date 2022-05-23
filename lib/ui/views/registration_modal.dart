import 'package:allergy/l10n/l10n.dart';
import 'package:flutter/material.dart';
import '../../const/allergies.dart';

class RegistrationModal extends StatefulWidget {
  // 使用するStateを指定
  @override
  _RegistrationModalState createState() => _RegistrationModalState();
}

class _RegistrationModalState extends State<RegistrationModal> {
  List<num> selectedAllergyCodes = [];
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
                bool isSelected = selectedAllergyCodes.any((value) {
                  return value == Allergies.list[index].code;
                });
                return Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black38),
                      ),
                    ),
                    child: ListTile(
                      leading: Text(Allergies.list[index].code.toString()),
                      title: Text(Allergies.list[index].name.ja),
                      trailing: isSelected ? const Icon(Icons.done) : null,
                      onTap: () {
                        bool isSelected = selectedAllergyCodes.any((value) {
                          return value == Allergies.list[index].code;
                        });

                        if (isSelected) {
                          setState(() {
                            selectedAllergyCodes
                                .remove(Allergies.list[index].code);
                          });
                        } else {
                          setState(() {
                            selectedAllergyCodes
                                .add(Allergies.list[index].code);
                          });
                        }
                      },
                    ));
              },
            )));
  }
}
