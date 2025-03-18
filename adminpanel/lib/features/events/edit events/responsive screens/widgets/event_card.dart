import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/features/events/edit%20events/responsive%20screens/widgets/event_dialog.dart';
import 'package:adminpanel/features/events/edit%20events/responsive%20screens/widgets/mobileevent_dialog_.dart';
import 'package:flutter/material.dart';

  
class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String posterUrl;
  final Function(String, String, String) onEdit;
  final Function() onDelete;

  const EventCard({
    Key? key,
    required this.title,
    required this.date,
    required this.posterUrl,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showDialog(context: context, 
        builder: (BuildContext context){
          if (MediaQuery.of(context).size.width <= DSizes.mobileScreenSize){
          return MobileEventDialog(
            title: title, 
            date: date, 
            posterUrl: posterUrl, 
            onEdit: onEdit, onDelete: 
            onDelete);   }
          else{
            return EventDialog(title: title, 
            date: date, 
            posterUrl: posterUrl, 
            onEdit: onEdit, onDelete: 
            onDelete);
          }
        }
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(    //not scrolling
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      date,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Divider(thickness: 1,indent: 5,endIndent:5,),
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.network(
                              posterUrl,
                              errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                                return Text('Image not available');
                              },
                            width: double.infinity,
                            height: 500,
                            fit: BoxFit.cover,
                     ),
                                       ),

                  
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  