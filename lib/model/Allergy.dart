import 'package:allergy/model/AllergyName.dart';

class Allergy {
  num code = 0;
  String abbreviation = "";
  AllergyName name = AllergyName("");

  Allergy(this.code, this.abbreviation, this.name);
}
