import 'package:adminpanel/core/constants/enums.dart';

class HelperFunctions {
  static String deptNames(Departments value) {
    if (value == Departments.cse) {
      return "CSE";
    } else if (value == Departments.agri) {
      return "Agri";
    } else if (value == Departments.aids) {
      return "Aids";
    } else if (value == Departments.ece) {
      return "ece";
    } else if (value == Departments.eee) {
      return "eee";
    } else if (value == Departments.mech) {
      return "Mech";
    } else if (value == Departments.biomedi) {
      return "Bio Medical";
    } else if (value == Departments.civil) {
      return "Civil";
    } else if (value == Departments.foodtech) {
      return "Food Tech";
    } else if (value == Departments.cyber) {
      return "Cyber";
    } else {
      return "-";
    }
  }


   static List<String> get departmentNames => [
        "CSE",
        "Agri",
        "Aids",
        "ECE",
        "EEE",
        "Mech",
        "Bio Medical",
        "Civil",
        "Food Tech",
        "Cyber"
      ];
}
