import 'package:adminpanel/core/constants/button_styles/elevated_buttons.dart';
import 'package:adminpanel/core/constants/fonts.dart';
import 'package:adminpanel/core/constants/input%20fields/basic_input.dart';
import 'package:adminpanel/core/constants/input%20fields/dob_picker.dart';
import 'package:adminpanel/core/constants/input%20fields/drop_down_input.dart';
import 'package:adminpanel/core/constants/input%20fields/image_picker.dart';
import 'package:adminpanel/core/constants/input%20fields/radio_button.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/core/helper%20functions/events.dart';
import 'package:flutter/material.dart';

class AddEventsDesktop extends StatelessWidget {
  const AddEventsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("   ADD EVENTS",style: DFont.title,),
              SizedBox(height: DSizes.xl,),
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Expanded(
                    child: Card(
                      elevation: 20,
                      child: Container(
                        height: 590,
                        width: 820,
                        color:Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             Text("   Event Info",style: DFont.subtitle,),
                             Divider(thickness: 1,indent: 10,endIndent: 10,),
                            
                             RadioButton(
                              label: "", 
                              options: const ['Our College','Other College'],
                              selectedValue: "", 
                              onChanged: (Value){}),
                            
                             SizedBox(height: DSizes.spaceBtwInputFields,),
                            
                             Expanded(child:DropDownInput(label: 'Event categories', items: HelperFunctions1.eventCategories, onChanged: (p0){}) ),
                            
                             SizedBox(height: 5,),
                            
                             Expanded(child: BasicInput(label: "Event title")),
                             Expanded(child: BasicInput(label: "Location")),
                             Expanded(child: CustomDatePicker(label: "Event Date", onDateSelected:(value){})),
                             Expanded(child: BasicInput(label: "Link for the event")), //////////must changeeee
                            
                              
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              
                  SizedBox(width: DSizes.xl,),
                          
                  
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Card(
                        color: Colors.transparent,
                        elevation: 20,
                        child: CustomImagePicker(
                          label: "Add the event poster",
                          onImageSelected: (value){},
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
                            child: ElevatedButton(
                              onPressed: () {},
                              style: DElevatedButtons.loginelevatedButton,
                              child: Text(
                                'POST THE EVENT',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
      )
    );
  }
}