import 'dart:convert';

class MenuRepo {
  static String getAll() {
    return json.encode([
      {
        "id": 0,
        "name": "Special Offers",
      },
      {
        "id": 1,
        "name": "Main Course",
      },
      {
        "id": 2,
        "name": "Drinks",
      },
      {
        "id": 3,
        "name": "Deserts",
      }
    ]);
  }
}
