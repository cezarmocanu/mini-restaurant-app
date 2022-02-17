import 'package:flutter_test/flutter_test.dart';
import 'package:kitchen_it/model/menu.dart';
import 'package:kitchen_it/repo_mock/menu_repo.dart';
import 'package:kitchen_it/services/menu_service.dart';

void main() {
  test("Should deserialize menu string to a list of maps ", () {
    String testString = MenuRepo.getAll();
    List<Menu> expected = [
      Menu(
        id: 0,
        name: "Special Offers",
      ),
      Menu(
        id: 1,
        name: "Main Course",
      ),
      Menu(
        id: 2,
        name: "Drinks",
      ),
      Menu(id: 3, name: "Deserts")
    ];
    for (int i = 0; i < expected.length; i++) {
      expect(MenuSrevice.fromString(testString).elementAt(i).id, expected.elementAt(i).id);
    }
  });
}
