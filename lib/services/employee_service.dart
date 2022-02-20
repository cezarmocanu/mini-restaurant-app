import 'dart:convert';

import 'package:kitchen_it/model/employee.dart';

class EmployeeService {
  static List<Employee> fromString(String employeeString) {
    return (json.decode(employeeString) as List).map((employeeMap) => Employee.fromJson(employeeMap)).toList();
  }
}
