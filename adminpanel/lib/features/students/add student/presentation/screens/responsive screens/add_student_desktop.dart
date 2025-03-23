import 'dart:js_interop';

import 'package:adminpanel/core/constants/button_styles/elevated_buttons.dart';
import 'package:adminpanel/core/constants/fonts.dart';
import 'package:adminpanel/core/constants/input%20fields/basic_input.dart';
import 'package:adminpanel/core/constants/input%20fields/date_picker.dart';
import 'package:adminpanel/core/constants/input%20fields/drop_down_input.dart';
import 'package:adminpanel/core/constants/input%20fields/image_picker.dart';
import 'package:adminpanel/core/constants/input%20fields/radio_button.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/core/helper%20functions/department.dart';
import 'package:adminpanel/core/helper%20functions/formatter.dart';
import 'package:adminpanel/features/students/add%20student/presentation/bloc/submit_bloc.dart';
import 'package:adminpanel/features/students/add%20student/presentation/bloc/submit_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddStudentDesktop extends StatefulWidget {
  @override
  State<AddStudentDesktop> createState() => _AddStudentDesktopState();
}

class _AddStudentDesktopState extends State<AddStudentDesktop> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController regNoController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobcontroller = TextEditingController();
  String yearController = '';
  String selectedGender = 'Male';
  String selectedDepartment = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddStudentBloc(),
      child: Scaffold(
        body: Container(
          width: 1500,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(DSizes.borderRadiusMd)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: DSizes.borderRadiusLg,
                    ),
                    Text(
                      "  Add Student",
                      style: DFont.title,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        card(context, basicInformation(context),
                            "Basic Information"),
                        card(context, accountInformation(context),
                            "Account Information"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget card(BuildContext context, Widget body, String title) {
    return Expanded(
      child: Card(
        elevation: 10,
        child: Container(
          height: 500,
          width: 500,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(DSizes.borderRadiusMd)),
          child: Column(
            children: [
              Text(
                title,
                style: DFont.title,
              ),
              const SizedBox(
                height: DSizes.sm,
              ),
              const Divider(
                endIndent: 10,
                indent: 10,
                thickness: 1,
              ),
              const SizedBox(
                height: DSizes.md,
              ),
              body
            ],
          ),
        ),
      ),
    );
  }

  Widget basicInformation(BuildContext context) {
    String selectedGender = 'Female';
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: BasicInput(
              label: "First name",
              controller: firstNameController,
            )),
            const SizedBox(
              width: 5,
            ),
            Expanded(
                child: BasicInput(
              label: "Last name",
              controller: lastNameController,
            )),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        const SizedBox(
          height: DSizes.spaceBtwInputFields,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: BasicInput(
              label: "Reg No.",
              keyboardType: TextInputType.phone,
              controller: regNoController,
            )),
            const SizedBox(
              width: 5,
            ),
            Expanded(
                child: DropDownInput(
              label: "Department",
              items: HelperFunctions.departmentNames,
              onChanged: (p0) {
                setState(() {
                  departmentController.text = p0 ?? 'none';
                });
              },
            )),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        const SizedBox(
          height: DSizes.spaceBtwInputFields,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: BasicInput(
              label: "Phone No.",
              keyboardType: TextInputType.phone,
              controller: phoneNoController,
            )),
            const SizedBox(
              width: 5,
            ),
            Expanded(
                child: DropDownInput(
                    label: "Gender",
                    items: const ["Male", "Female"],
                    onChanged: (value) {
                      genderController.text = value ?? '';
                    })),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        const SizedBox(
          height: DSizes.spaceBtwInputFields,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: CustomDatePicker(
                    label: "DOB",
                    onDateSelected: (value) {
                      dobcontroller.text = Formatter.formatDate(value);
                    })),
            const SizedBox(
              width: 5,
            ),
            Expanded(
                child: BasicInput(
              label: "EMail",
              controller: emailController,
            )),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        const SizedBox(
          height: DSizes.spaceBtwInputFields,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: DropDownInput(
              label: "Year",
              items: HelperFunctions.yearNames,
              onChanged: (p0) {
                yearController = p0 ?? '';
              },
            )),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: CustomImagePicker(
                  label: "Profile", onImageSelected: (value) {}),
            ),
          ],
        ),
        const SizedBox(
          height: DSizes.spaceBtwInputFields,
        ),
      ],
    );
  }

  Widget accountInformation(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: DSizes.spaceBtwItems,
          ),
          Padding(
            padding: EdgeInsets.only(left: 32, right: 32.0),
            child: BasicInput(
              label: "UserName",
              hintText: "example@gmail.com",
              controller: usernameController,
            ),
          ),
          const SizedBox(
            height: DSizes.spaceBtwInputFields,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: BasicInput(
              label: "Password",
              obscureText: true,
              controller: passwordController,
            ),
          ),
          const SizedBox(
            height: DSizes.spaceBtwInputFields,
          ),
          Padding(
            padding: EdgeInsets.only(left: 32, right: 32),
            child: BasicInput(
              label: "Confirm Password",
              hintText: "Re-Enter the password",
              controller: confirmPasswordController,
            ),
          ),
          const SizedBox(
            height: DSizes.spaceBtwSections,
          ),
          const Divider(
            thickness: 1,
            endIndent: 10,
            indent: 10,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: const SizedBox(
                  width: 390,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.white),
                ),
                style: DElevatedButtons.dangerelevatedButton,
              ),
              const SizedBox(
                width: DSizes.spaceBtwItems,
              ),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AddStudentBloc>(context).add(SubmitFormEvent(
                    dob: dobcontroller.text,
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    regNo: regNoController.text,
                    phoneNo: phoneNoController.text,
                    email: emailController.text,
                    username: usernameController.text,
                    password: passwordController.text,
                    confirmPassword: confirmPasswordController.text,
                    gender: genderController.text,
                    department: departmentController.text,
                    year: yearController,
                  ));
                },
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
                style: DElevatedButtons.successelevatedButton,
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ],
      ),
    );
  }
}
