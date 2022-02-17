import 'package:flutter_test/flutter_test.dart';
import 'package:kitchen_it/model/employee.dart';
import 'package:kitchen_it/repo_mock/employee_repo.dart';
import 'package:kitchen_it/services/employee_service.dart';

void main() {
  test("Should deserialize employee string to maps", () {
    String testString = EmployeeRepo.getAll();
    List<Employee> expected = [
      Employee(
        id: 0,
        firstName: "Andrei",
        lastName: "Leonard",
      ),
      Employee(
        id: 1,
        firstName: "Eugen",
        lastName: "Mihalache",
      ),
      Employee(
        id: 2,
        firstName: "Clara",
        lastName: "Nitu",
      )
    ];
    for (int i = 0; i < expected.length; i++) {
      expect(EmployeeService.fromString(testString).elementAt(i).id, expected.elementAt(i).id);
    }
  });
}
