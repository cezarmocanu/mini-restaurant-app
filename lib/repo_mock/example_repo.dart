import 'dart:convert';

class ExampleRepo {
  static String getAll() {
    return json.encode([
      {
        "id": 0,
        "name": "Example 1",
        "isActive": true,
      },
      {
        "id": 1,
        "name": "Example 2",
        "isActive": false,
      },
      {
        "id": 2,
        "name": "Example 2",
        "isActive": false,
      },
    ]);
  }
}
