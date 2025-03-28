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

  static List<String> get yearNames => [
    "I","II","III","IV"
  ];

  static List<String> get graduationNames=>[
    'UG','PG'
  ];

  static List<String> get masteryears => [
    "I","II"
  ];

  static List<String> get semesters =>[
    '1','2','3','4','5','6','7','8'
  ];

  static List<String> get mastersemesters =>[
    '1','2','3','4'
  ];

  static List<String> get regulations =>[
    '2021'
  ];

  static List<String> get degreeNames =>[
    'B.E / B.Tech','M.E / M.Tech','MBA',
  ];

  static List<String> get mbaBranches =>[
    ' Marketing',
    'Finance',
    'Human Resource Management',
    'Supply Chain Management',
    'Information Technology',
    'Business Analytics',
    'Health Care Management',
    'Others'
  ];


}
