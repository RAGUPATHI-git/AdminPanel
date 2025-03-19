import 'package:adminpanel/core/constants/fonts.dart';
import 'package:adminpanel/core/constants/input%20fields/basic_input.dart';
import 'package:adminpanel/core/constants/input%20fields/radio_button.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/features/events/edit%20events/responsive%20screens/widgets/event_card.dart';
import 'package:flutter/material.dart';

class EditEventsTablet extends StatefulWidget {
  const EditEventsTablet({super.key});

  @override
  State<EditEventsTablet> createState() => _EditEventsTabletState();
}

class _EditEventsTabletState extends State<EditEventsTablet> {

  String? _selectedValue = 'Our College';
  String _searchQuery = '';
  
  final List<Map<String, String>> ourevents = [   
    {
      'title': 'Job Fair',
      'date': 'April 15, 2025',
      'posterurl': 'https://marketplace.canva.com/EAGPwobWTG8/2/0/1131w/canva-blue-and-yellow-modern-job-fair-flyer-cb3YGfT3dKg.jpg'
    },
    {
      'title': 'Music Festival',
      'date': 'May 10, 2025',
      'posterurl': 'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/modern-music-event-poster-design-template-84e8234cb987682b79142b4839886e47_screen.jpg?ts=1637023328'
    },
    ];
  

  final List<Map<String, String>> otherevents = [
    {
      'title': 'Tech Conference',
      'date': 'March 20, 2025',
      'posterurl': 'https://static.vecteezy.com/system/resources/previews/041/180/849/non_2x/technology-event-poster-editor_template.jpeg'
    },
    {
      'title': 'Sports Day',
      'date': 'June 5, 2025',
      'posterurl': 'https://thumbs.dreamstime.com/b/badminton-tournament-banner-template-design-d-realistic-isolated-shuttlecock-championship-invitation-horizontal-poster-351217871.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {

     final ourfilteredEvents = ourevents.where((event) {
      return event['title']!.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    final otherfilteredEvents = otherevents.where((event) {
      return event['title']!.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("EDIT / DELETE EVENTS", style: DFont.title),
                
              Divider(thickness: 1),
                
              RadioButton(
                label: "",
                options: const ['Our College', 'Other College'],
                selectedValue: '$_selectedValue', 
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value; 
                  });
                },
              ),

                BasicInput(
                      label: 'Search for Event',
                      onChanged: (value) {
                      setState(() {
                        _searchQuery = value; 
                      });
                    },
                   //prefixIcon: 
                ),
                        
                 SizedBox(height: DSizes.xl,),
                 Divider(thickness: 1),
                 SizedBox(height: DSizes.xs,),
          
            
             
              if (_selectedValue == 'Our College') 
                
                GridView.count(
                  crossAxisCount: 3,
                  padding: const EdgeInsets.all(10),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  shrinkWrap: true,
                  children: ourfilteredEvents.map((event) {
                    return EventCard(
                      title: event['title'] ?? 'No Title', 
                      date:event['date'] ?? 'No Date', 
                      posterUrl:event['posterurl'] ?? 'No Poster',
                      onEdit: (newTitle, newDate, newPosterUrl) {
                        
                      },
                      onDelete: () {
                
                      }
                 );
                  }).toList(), 
                ),
          
          
          
              if (_selectedValue == 'Other College') 
                GridView.count(
                  crossAxisCount: 3,
                  padding: const EdgeInsets.all(10),
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  shrinkWrap: true,
                  children: otherfilteredEvents.map((event) {
                    return EventCard(
                      title: event['title'] ?? 'No Title', 
                      date:event['date'] ?? 'No Date', 
                      posterUrl:event['posterurl'] ?? 'No Poster',
                      onEdit: (newTitle, newDate, newPosterUrl) {
                        
                      },
                      onDelete: () {
                        
                      }
                      );
                      
                  }).toList(), 
                )],
                  ),
                ),
            
          ),
        );
  }
  }
