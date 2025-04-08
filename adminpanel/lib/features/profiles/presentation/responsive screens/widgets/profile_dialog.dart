import 'package:adminpanel/core/constants/button_styles/elevated_buttons.dart';
import 'package:adminpanel/core/constants/input%20fields/basic_input.dart';
import 'package:adminpanel/core/constants/input%20fields/image_picker.dart';
import 'package:flutter/material.dart';

class ProfileDialog extends StatefulWidget {
  final Map<String, dynamic> profile;
  final Function(Map<String, dynamic>) onSave;
  final Function() onDelete;

  const ProfileDialog({
    Key? key,
    required this.profile,
    required this.onSave,
    required this.onDelete,
  }) : super(key: key);

  @override
  _ProfileDialogState createState() => _ProfileDialogState();
}

class _ProfileDialogState extends State<ProfileDialog> {
  late TextEditingController _profileController;
  late TextEditingController _registerController;
  late TextEditingController _nameController;
  late TextEditingController _usernameController;
  late TextEditingController _dobController;
  late TextEditingController _departmentController;
  late TextEditingController _yearController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _profileController = TextEditingController(text: widget.profile['image']);
    _registerController = TextEditingController(text: widget.profile['regno']);
    _nameController = TextEditingController(text: widget.profile['name']);
    _usernameController = TextEditingController(text: widget.profile['username']);
    _dobController = TextEditingController(text: widget.profile['dob']);
    _departmentController = TextEditingController(text: widget.profile['department']);
    _yearController = TextEditingController(text: widget.profile['year']);
    _phoneController = TextEditingController(text: widget.profile['phone']);
    _emailController = TextEditingController(text: widget.profile['email']);
  }

  @override
  void dispose() {
    _profileController.dispose();
    _registerController.dispose();
    _nameController.dispose();
    _usernameController.dispose();
    _dobController.dispose();
    _departmentController.dispose();
    _yearController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Edit Profile"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            CustomImagePicker(
              length: 300,
              breadth: 300,
              backgroundImageUrl: _profileController.text,
              onImageSelected: (value) {
                _profileController.text = '$value'; 
              },
              label: '',
            ),
            Text("Click on the image to edit"),
        
            SizedBox(width: 20),
        
            BasicInput(label: 'Register Number', controller: _registerController),
            BasicInput(label: 'Name', controller: _nameController),
            BasicInput(label: 'Username', controller: _usernameController),
            BasicInput(label: 'DOB', controller: _dobController),
            BasicInput(label: 'Department', controller: _departmentController),
            BasicInput(label: 'Year', controller: _yearController),
            BasicInput(label: 'Phone No.', controller: _phoneController),
            BasicInput(label: 'Email ID', controller: _emailController),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          style: DElevatedButtons.successelevatedButton,
          onPressed: () {
            Map<String, String> updatedProfile = {
             'Imageurl': _profileController.text,
              'RegNo': _registerController.text,
              'Name': _nameController.text,
              'Username': _usernameController.text,
              'DOB': _dobController.text,
              'Department': _departmentController.text,
              'Year': _yearController.text,
              'Phone': _phoneController.text,
              'Email': _emailController.text,
            };
            widget.onSave(updatedProfile);
            Navigator.of(context).pop();
          },
          child: Text('Edit Profile'),
        ),


        ElevatedButton(
          style: DElevatedButtons.dangerelevatedButton,
          onPressed: () {
            widget.onDelete();
            Navigator.of(context).pop();
          },
          child: Text('Delete Profile'),
        ),


        ElevatedButton(
          style: DElevatedButtons.customelevatedButton,
          onPressed: () {
            Navigator.of(context).pop(); 
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}