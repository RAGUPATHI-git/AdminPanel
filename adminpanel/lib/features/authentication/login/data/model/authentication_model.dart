import 'package:adminpanel/core/constants/enums.dart';
import 'package:adminpanel/core/helper%20functions/formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  String firstName;
  String lastName;
  String userName;
  String email;
  String phoneNumber;
  String profilePicture;
  AppRole role;
  DateTime? createdAt;
  DateTime? updatedAt;
  String dob;
  String year;
  String department;
  String regno;

//constructor for userModel.
  UserModel(
      {this.id,
      required this.email,
      this.department = '',
      this.firstName = '',
      this.lastName = '',
      this.userName = '',
      this.phoneNumber = '',
      this.profilePicture = '',
      this.role = AppRole.staff,
      this.createdAt,
      this.updatedAt,
      this.dob = '',
      this.year = 'I',
      this.regno = ''});

  //Helper methods
  String get fullName => Formatter.fullName(firstName, lastName);
  String get formattedDate => Formatter.formatDate(createdAt);
  String get formattedUpdatedDate => Formatter.formatDate(updatedAt);

  // static function to create an empty user model.
  static UserModel empty() => UserModel(email: '', dob: '', regno: '');

  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'Role': role.name.toString(),
      'createdAt': createdAt,
      'updatedAt': createdAt = DateTime.now(),
      'dob': dob,
      'department': department,
      'year': year
    };
  }

  // Factory method to create a usermodel from a firebase document snapshot.
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        email: data.containsKey('Email') ? data['Email'] ?? '' : '',
        role: (data['Role'] == 'admin') ? AppRole.admin : AppRole.staff,
        firstName: data.containsKey('FirstName') ? data['FirstName'] ?? '' : '',
        lastName: data.containsKey('LastName') ? data['LastName'] ?? '' : '',
        userName: data.containsKey('UserName') ? data['UserName'] ?? '' : '',
        phoneNumber:
            data.containsKey('PhoneNumber') ? data['PhoneNumber'] ?? '' : '',
        profilePicture: data.containsKey('profilePicture')
            ? data['profilePicture'] ?? ''
            : '',
        // createdAt: data['createdAt'],
        // updatedAt: data['updatedAt'],
      );
    } else {
      return empty();
    }
  }
}
