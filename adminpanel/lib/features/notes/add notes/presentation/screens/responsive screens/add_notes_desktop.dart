import 'package:adminpanel/core/constants/button_styles/elevated_buttons.dart';
import 'package:adminpanel/core/constants/fonts.dart';
import 'package:adminpanel/core/constants/input%20fields/basic_input.dart';
import 'package:adminpanel/core/constants/input%20fields/date_picker.dart';
import 'package:adminpanel/core/constants/input%20fields/drop_down_input.dart';
import 'package:adminpanel/core/constants/input%20fields/pdf_picker.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/core/helper%20functions/department.dart';
import 'package:adminpanel/features/notes/all%20notes/presentation/screens/all_notes_screen.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddNotesDesktop extends StatefulWidget {
  const AddNotesDesktop({super.key});

  @override
  State<AddNotesDesktop> createState() => _AddNotesDesktopState();
}

class _AddNotesDesktopState extends State<AddNotesDesktop> {
  
  String? selectedDegree;
  String? selectedBranch;
  String? selectedYear;
  String? selectedSemester;

  final Map<String, List<String>> degreeBranches ={
    'B.E / B.Tech':HelperFunctions.departmentNames,
    'M.E / M.Tech':HelperFunctions.departmentNames,
    'MBA':HelperFunctions.mbaBranches
  };

  final Map<String, List<String>> degreeYears={
    'B.E / B.Tech':HelperFunctions.yearNames,
    'M.E / M.Tech':HelperFunctions.masteryears,
    'MBA':HelperFunctions.masteryears
  };

  final Map<String,List<String>> degreeSemesters ={
    'B.E / B.Tech':HelperFunctions.semesters,
    'M.E / M.Tech':HelperFunctions.mastersemesters,
    'MBA':HelperFunctions.mastersemesters
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "   ADD NOTES",
                  style: DFont.title,
                ),
                SizedBox(height: DSizes.xl),
                Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("   Notes Info", style: DFont.subTitle),
                        Divider(
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                        ),
                        
                        DropDownInput(
                          label: "Degree",
                          items: HelperFunctions.degreeNames,
                          onChanged: (value) {
                            setState((){
                              selectedDegree = value;
                              selectedBranch= null;   //not reseting  
                              selectedYear=null;
                              selectedSemester=null;
                            }
                            );
                          },
                        ),
                        SizedBox(height: DSizes.sm),
                        DropDownInput(
                          label: "Branch",
                          items: selectedDegree != null ?degreeBranches[selectedDegree!]?? [] : [],
                          onChanged: (value) {
                            setState(() {
                              selectedBranch= value;
                            });
                          },
                        ),
                        SizedBox(height: DSizes.sm),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Expanded(
                                        child: DropDownInput(
                                          label: "Year",
                                          items: selectedDegree != null ?degreeYears[selectedDegree!]?? [] : [],
                                          onChanged: (value) {
                                            setState((){
                                              selectedYear= value;
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(width: 8), 
                                      Expanded(
                                        child: DropDownInput(
                                          label: "Semester",
                                          items: selectedDegree != null ?degreeSemesters[selectedDegree!]?? [] : [],
                                          onChanged: (value) {
                                            setState((){
                                              selectedSemester= value;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                
                                  SizedBox(height: DSizes.sm),
                                  BasicInput(label: "Subject Code "),
                                  SizedBox(height: DSizes.sm),
                                  BasicInput(label: "Subject Title"),
                                  SizedBox(height: DSizes.sm),
                                  BasicInput(label: "Uploaded By"),
                                  SizedBox(height: DSizes.sm),
                                  CustomDatePicker(
                                    label: "Updated On",
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now(),
                                    onDateSelected: (value) {},
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20), 
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomPDFPicker(
                                  label: "Upload Notes PDF",
                                  length: 300,
                                  breadth: 500,
                                  onPDFSelected: (value){},
                                ),
                                SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    showTopSnackBar( Overlay.of(context) ,CustomSnackBar.info(message: "Notes added / not added . Navigating to Notes List") );
                                    Navigator.push((context), MaterialPageRoute(builder: (context) => AllNotesScreen(),));
                                  },
                                  child: Text(
                                    'POST THE SYLLABUS',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: DElevatedButtons.loginelevatedButton,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                 ),
              ]
            ),
          ),
        )
      )
    );
 }
}