import 'package:adminpanel/core/constants/button_styles/elevated_buttons.dart';
import 'package:adminpanel/core/constants/fonts.dart';
import 'package:adminpanel/core/constants/input%20fields/basic_input.dart';
import 'package:adminpanel/core/constants/input%20fields/date_picker.dart';
import 'package:adminpanel/core/constants/input%20fields/drop_down_input.dart';
import 'package:adminpanel/core/constants/input%20fields/image_picker.dart';
import 'package:adminpanel/core/constants/input%20fields/radio_button.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/core/helper%20functions/events.dart';
import 'package:flutter/material.dart';

class AddEventsTablet extends StatelessWidget {
  const AddEventsTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            
            children: [
              Text("      ADD EVENTS",style: DFont.title,),
              SizedBox(height: DSizes.xl,),

              Center(
                child: Card(
                  elevation: 10,
                  child: Container(
                              height: 590,
                              width: 820,
                              color:Colors.transparent,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                   Text("   Event Info",style: DFont.subTitle,),
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
                                   Expanded(child: CustomDatePicker(label: "Event Date", 
                                            firstDate: DateTime(2025),
                                            lastDate: DateTime(2050),
                                            onDateSelected:(value){})), 
                                   Expanded(child: BasicInput(label: "Link for the event")), 
                                  
                                    
                                  ],
                                ),
                              ),
                            ),
                ),
              ),

              SizedBox(height: 10,),

              Center(
                child: CustomImagePicker(
                  onImageSelected: (p0){},
                  length:300,
                  breadth:820,
                  label: 'Add the event poster',),
              ),

              SizedBox(height: DSizes.xl,),

              Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
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
                        ),
            ],
          ),
        ),
      ),
    );
  }
}