import 'dart:convert';

class EmployeeRepo {
  static String getAll() {
    return json.encode([
      {
        "id": 0,
        "firstName": "Andrei",
        "lastName": "Lenonard",
      },
      {
        "id": 1,
        "firstName": "Eugen",
        "lastName": "Mihalache",
      },
      {
        "id": 2,
        "firstName": "Clara",
        "lastName": "Nitu",
      },
    ]);
  }
}
