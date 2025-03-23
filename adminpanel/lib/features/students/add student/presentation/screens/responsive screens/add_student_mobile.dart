import 'package:adminpanel/core/constants/animations.dart';
import 'package:adminpanel/core/constants/button_styles/elevated_buttons.dart';
import 'package:adminpanel/core/constants/fonts.dart';
import 'package:adminpanel/core/constants/icons.dart';
import 'package:adminpanel/core/constants/input%20fields/basic_input.dart';
import 'package:adminpanel/core/constants/input%20fields/date_picker.dart';
import 'package:adminpanel/core/constants/input%20fields/drop_down_input.dart';
import 'package:adminpanel/core/constants/input%20fields/image_picker.dart';
import 'package:adminpanel/core/constants/input%20fields/radio_button.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/core/helper%20functions/department.dart';
import 'package:adminpanel/core/helper%20functions/formatter.dart';
import 'package:adminpanel/core/helper%20functions/validators.dart';
import 'package:adminpanel/features/students/add%20student/presentation/bloc/submit_bloc.dart';
import 'package:adminpanel/features/students/add%20student/presentation/bloc/submit_event.dart';
import 'package:adminpanel/features/students/add%20student/presentation/bloc/submit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddStudentMobile extends StatefulWidget {
  AddStudentMobile({super.key});

  @override
  State<AddStudentMobile> createState() => _AddStudentMobileState();
}

class _AddStudentMobileState extends State<AddStudentMobile> {
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

  bool saveLoading = false;

  final _formKey = GlobalKey<FormState>();

  final _basicInformationKey = GlobalKey<FormState>();

  void controllerClear() {
    firstNameController.clear();
    lastNameController.clear();
    regNoController.clear();
    phoneNoController.clear();
    emailController.clear();
    usernameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    departmentController.clear();
    genderController.clear();
    dobcontroller.clear();
    yearController = '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddStudentBloc, AddStudentState>(
      listener: (context, state) {
        if (state is AddStudentLoading) {
          state.isLoading = true;
        } else if (state is AddStudentSuccess) {
          showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.success(
                message: "Student Added Successfully",
                icon: SvgPicture.asset(
                  DIcons().student,
                  color: Colors.white,
                  height: 100,
                  width: 100,
                ),
              ));
          controllerClear();
        } else if (state is AddStudentFailure) {
          saveLoading = false;
          showTopSnackBar(Overlay.of(context),
              CustomSnackBar.error(message: "Failed to create "));
          controllerClear();
        }
      },
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
                    Text(
                      "  Add Student",
                      style: DFont.title,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        card(context, basicInformation(context),
                            "Basic Information"),
                        const SizedBox(
                          height: DSizes.spaceBtwCards,
                        ),
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
    return Card(
      elevation: 10,
      child: Container(
        height: 510,
        width: 500,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(DSizes.borderRadiusMd)),
        child: SingleChildScrollView(
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
    return Form(
      key: _basicInformationKey,
      child: Column(
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
                validator: (value) => Dvalidators().notEmpty(value),
              )),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  child: BasicInput(
                label: "Last name",
                controller: lastNameController,
                validator: (value) => Dvalidators().notEmpty(value),
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
                      validator: (value) =>
                          Dvalidators().numberValidator(value))),
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
                validator: (value) => Dvalidators().phoneNumberValidator(value),
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
                        setState(() {
                          dobcontroller = value as TextEditingController;
                        });
                      })),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  child: BasicInput(
                label: "E-mail",
                controller: emailController,
                validator: (value) => Dvalidators().emailValidation(value),
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
      ),
    );
  }

  Widget accountInformation(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
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
                validator: (value) => Dvalidators().emailValidation(value),
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
                validator: (value) => Dvalidators().passwordValidation(value),
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
                  validator: (value) =>
                      Dvalidators().confirmPassword(value, passwordController)),
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
                BlocBuilder<AddStudentBloc, AddStudentState>(
                  builder: (context, state) {
                    return (state is AddStudentLoading && state.isLoading)
                        ? SizedBox(
                            height: 100,
                            width: 100,
                            child: Lottie.asset(DAnimations.loading))
                        : ElevatedButton(
                            onPressed: () {
                              if (_basicInformationKey.currentState!
                                      .validate() &&
                                  _formKey.currentState!.validate()) {
                                BlocProvider.of<AddStudentBloc>(context)
                                    .add(SubmitFormEvent(
                                  dob: dobcontroller.text,
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  regNo: regNoController.text,
                                  phoneNo: phoneNoController.text,
                                  email: emailController.text,
                                  username: usernameController.text,
                                  password: passwordController.text,
                                  confirmPassword:
                                      confirmPasswordController.text,
                                  gender: genderController.text,
                                  department: departmentController.text,
                                  year: yearController,
                                ));
                              }
                            },
                            child: Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: DElevatedButtons.successelevatedButton,
                          );
                  },
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
