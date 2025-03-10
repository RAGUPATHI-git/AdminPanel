import 'package:adminpanel/core/constants/fonts.dart';
import 'package:adminpanel/core/constants/input%20fields/basic_input.dart';
import 'package:adminpanel/core/constants/input%20fields/dob_picker.dart';
import 'package:adminpanel/core/constants/input%20fields/drop_down_input.dart';
import 'package:adminpanel/core/constants/input%20fields/image_picker.dart';
import 'package:adminpanel/core/constants/input%20fields/radio_button.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/core/helper%20functions/department.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddStudentDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1500,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(DSizes.borderRadiusMd)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
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
                Row(
                  children: [
                    card(context, basicInformation(context),
                        "Basic Information"),
                    card(context, accountInformation(context),
                        "Account Information"),
                  ],
                )
              ],
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
            Expanded(child: BasicInput(label: "First name")),
            const SizedBox(
              width: 5,
            ),
            Expanded(child: BasicInput(label: "Last name")),
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
            )),
            const SizedBox(
              width: 5,
            ),
            Expanded(
                child: DropDownInput(
              label: "Department",
              items: HelperFunctions.departmentNames,
              onChanged: (p0) {},
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
            )),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: RadioButton(
                  label: "Gender",
                  options: const ["Male", "Female"],
                  selectedValue: "Male",
                  onChanged: (value) {}),
            ),
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
                child:
                    CustomDatePicker(label: "DOB", onDateSelected: (value) {})),
            const SizedBox(
              width: 5,
            ),
            Expanded(
                child: BasicInput(
              label: "EMail",
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
              onChanged: (p0) {},
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
    return Column(
      children: [Text("account information")],
    );
  }
}
