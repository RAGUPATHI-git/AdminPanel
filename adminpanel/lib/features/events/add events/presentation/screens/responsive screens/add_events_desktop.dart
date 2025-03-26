import 'package:adminpanel/core/constants/button_styles/elevated_buttons.dart';
import 'package:adminpanel/core/constants/fonts.dart';
import 'package:adminpanel/core/constants/icons.dart';
import 'package:adminpanel/core/constants/input%20fields/basic_input.dart';
import 'package:adminpanel/core/constants/input%20fields/date_picker.dart';
import 'package:adminpanel/core/constants/input%20fields/drop_down_input.dart';
import 'package:adminpanel/core/constants/input%20fields/image_picker.dart';
import 'package:adminpanel/core/constants/input%20fields/radio_button.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/core/helper%20functions/events.dart';
import 'package:adminpanel/core/helper%20functions/formatter.dart';
import 'package:adminpanel/core/helper%20functions/validators.dart';
import 'package:adminpanel/features/events/add%20events/presentation/bloc/bloc/add_event_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddEventsDesktop extends StatefulWidget {
  const AddEventsDesktop({super.key});

  @override
  State<AddEventsDesktop> createState() => _AddEventsDesktopState();
}

class _AddEventsDesktopState extends State<AddEventsDesktop> {
  @override
  Widget build(BuildContext context) {
    String selectedCollege = 'Our College';
    String selectedCategory = '';
    final TextEditingController collegeController = TextEditingController();
    final TextEditingController categoryController = TextEditingController();
    final TextEditingController titleController = TextEditingController();
    final TextEditingController locationController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController linkController = TextEditingController();

    void controllerClear() {
      collegeController.clear();
      categoryController.clear();
      titleController.clear();
      locationController.clear();
      dateController.clear();
      linkController.clear();
    }

    return BlocListener<AddEventBloc, AddEventState>(
      listener: (context, state) {
        if (state is AddEventIsLoading) {
          state.isLoading = true;
        } else if (state is AddEventLoaded) {
          showTopSnackBar(
              Overlay.of(context),
              CustomSnackBar.success(
                  message: "Event Posted Successfully",
                  icon: SvgPicture.asset(DIcons().addEvent,
                      color: Colors.white, height: 100, width: 100)));
          controllerClear();
        } else if (state is AddEventError) {
          showTopSnackBar(Overlay.of(context),
              CustomSnackBar.error(message: " Failed to post event "));
          controllerClear();
        }
      },
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "   ADD EVENTS",
                style: DFont.title,
              ),
              SizedBox(
                height: DSizes.xl,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Card(
                      elevation: 20,
                      child: Container(
                        height: 590,
                        width: 820,
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "   Event Info",
                                style: DFont.subTitle,
                              ),
                              Divider(
                                thickness: 1,
                                indent: 10,
                                endIndent: 10,
                              ),
                              RadioButton(
                                  label: "",
                                  options: const [
                                    'Our College',
                                    'Other College'
                                  ],
                                  selectedValue: selectedCollege.toString(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedCollege = value ?? 'Our College';
                                      collegeController.text = selectedCollege;
                                    });
                                  }),
                              SizedBox(
                                height: DSizes.spaceBtwInputFields,
                              ),
                              Expanded(
                                  child: DropDownInput(
                                      label: 'Event categories',
                                      items: HelperFunctions1.eventCategories,
                                      onChanged: (value) {
                                        selectedCategory =  value ?? '';
                                        categoryController.text = selectedCategory;
                                      })),
                              SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                  child: BasicInput(
                                label: "Event title",
                                controller: titleController,
                              )),
                              Expanded(
                                  child: BasicInput(
                                label: "Location",
                                controller: locationController,
                                validator: (value) =>
                                    Dvalidators().notEmpty(value),
                              )),
                              Expanded(
                                  child: CustomDatePicker(
                                      label: "Event Date",
                                      firstDate: DateTime(2025),
                                      lastDate: DateTime(2050),
                                      onDateSelected: (value) {
                                        setState(() {
                                          dateController.text = Formatter.formatDate(value);
                                        });
                                      })),
                              Expanded(
                                  child: BasicInput(
                                label: "Link for the event",
                                controller: linkController,
                                validator: (value) =>
                                    Dvalidators().notEmpty(value),
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: DSizes.xl,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        color: Colors.transparent,
                        elevation: 20,
                        child: CustomImagePicker(
                          label: "Add the event poster",
                          onImageSelected: (value) {},
                          length: 490,
                          breadth: 390,
                        ),
                      ),
                      const SizedBox(
                        height: DSizes.spaceBtwItems,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 60,
                          width: 390,
                          child: BlocBuilder<AddEventBloc, AddEventState>(
                            builder: (context, state) {
                              return (state is AddEventIsLoading && state.isLoading)
                              ? SizedBox(height: 100,width: 100,
                                     //child: Lottie.asset(DAnimations.)
                                     )
                              :  ElevatedButton(
                                onPressed: () {
                                  context.read<AddEventBloc>().add(EventForm(
                                      college: selectedCollege,
                                      category: selectedCategory,
                                      title: titleController.text,
                                      location: locationController.text,
                                      date: dateController.text,
                                      link: linkController.text));
                                },
                                style: DElevatedButtons.loginelevatedButton,
                                child: Text(
                                  'POST THE EVENT',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
