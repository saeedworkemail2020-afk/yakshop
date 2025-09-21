import 'package:amozeshyar/Featuers/Interaction/DataModel/datamodel_herd.dart';
import 'package:amozeshyar/Featuers/Interaction/DataModel/datamodel_stock.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Interaction>DataModel>", () {
    test("Herd", () {
      final name =
          DataModeleHerd.fromjson({
            'name': 'Betty-1',
            'age': 4.33,
            'age_last_shaved': 426,
          }).name;
      final age =
          DataModeleHerd.fromjson({
            'name': 'Betty-1',
            'age': 4.33,
            'age_last_shaved': 426,
          }).age;
      final shaved =
          DataModeleHerd.fromjson({
            'name': 'Betty-1',
            'age': 4.33,
            'age_last_shaved': 426,
          }).shaved;
      expect(name, 'Betty-1');
      expect(age, 4.33);
      expect(shaved, 426);
    });
    test("Stock", () {
      final milk =
          DataModelStok(amount: {"milk": "41", "skins": "56"}).milk.toString();
      final skins =
          DataModelStok(amount: {"milk": "41", "skins": "56"}).skins.toString();
      expect(milk, '41');
      expect(skins, '56');
    });
  });
}
