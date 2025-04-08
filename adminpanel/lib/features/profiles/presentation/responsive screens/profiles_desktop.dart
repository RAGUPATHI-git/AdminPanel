import 'dart:ui';
import 'package:adminpanel/core/constants/animations.dart';
import 'package:adminpanel/core/constants/fonts.dart';
import 'package:adminpanel/features/profiles/presentation/responsive%20screens/widgets/profile_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class ProfilesDesktop extends StatelessWidget {
  const ProfilesDesktop({super.key});

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Profiles').snapshots(),
      builder: (context, snapshot) {

        if(snapshot.connectionState == ConnectionState.waiting || snapshot.hasError){
          return Center(
                        child: SizedBox(
                      height: 300,
                      width: 300,
                      child: LottieBuilder.asset(DAnimations.noData),
                    ));
        }

        final profiles = snapshot.data!.docs.map((doc){
          return{
            'image': doc['Imageurl'],
            'regno': doc['RegNo'],
            'name': doc['Name'],
            'username': doc['Username'],
            'dob': doc['DOB'],
            'department': doc['Department'],
            'year': doc['Year'],
            'phone': doc['Phone'],
            'email': doc['Email'],
          };
        }).toList();




        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("PROFILES", style: DFont.title),
                  SizedBox(height: 10),
                  Text("  Click on the profile to edit"),
                  Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Table(
                          columnWidths: {
                            0: FixedColumnWidth(100),
                            1: FixedColumnWidth(150),
                            2: FixedColumnWidth(120),
                            3: FixedColumnWidth(200),
                            4: FixedColumnWidth(120),
                            5: FixedColumnWidth(180),
                            6: FixedColumnWidth(80),
                            7: FixedColumnWidth(120),
                            8: FixedColumnWidth(200),
                          },
                          border: TableBorder(
                            top: BorderSide(width: 0.8, color: Colors.grey),
                            bottom: BorderSide(width: 0.2, color: Colors.grey),
                            horizontalInside: BorderSide(width: 0.8, color: Colors.grey),
                          ),
                          children: [
                            TableRow(
                              decoration: BoxDecoration(color: Colors.white),
                              children: [
                                tableHeader('PROFILE'),
                                tableHeader('REGNO'),
                                tableHeader('NAME'),
                                tableHeader('USER NAME'),
                                tableHeader('DOB'),
                                tableHeader('DEPARTMENT'),
                                tableHeader('YEAR'),
                                tableHeader('PHONE'),
                                tableHeader('EMAIL ID'),
                              ],
                            ),
                            for (var profile in profiles)
                              TableRow(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      _showEditDialog(context, profile, profiles);
                                    },
                                    child: tableCell(
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(profile['image']!),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10),
                                                  border: Border.all(color: Colors.grey.withOpacity(0.5), width: 2),
                                                ),
                                                child: Image.network(
                                                  profile['image']!,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error, stackTrace) {
                                                    return Container(
                                                      color: Colors.grey,
                                                      child: Icon(Icons.error, color: Colors.white)
                                                      );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  tableCell(Text(profile['regno']!)),
                                  tableCell(Text(profile['name']!)),
                                  tableCell(Text(profile['username']!)),
                                  tableCell(Text(profile['dob']!)),
                                  tableCell(Text(profile['department']!)),
                                  tableCell(Text(profile['year']!)),
                                  tableCell(Text(profile['phone']!)),
                                  tableCell(Text(profile['email']!)),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  void _showEditDialog(BuildContext context, Map<String, dynamic> profile, List<Map<String, dynamic>> profiles) {
    showDialog(
      context: context,
      builder: (context) {
        return ProfileDialog(
          profile: profile,
          onSave: (updatedProfile) {
            FirebaseFirestore.instance
            .collection("Profiles")
            .doc(profile['regno'])
            .update(updatedProfile);
          },
          onDelete: () {
             FirebaseFirestore.instance
                .collection('profiles')
                .doc(profile['regno'])
                .delete();
          },
        );
      },
    );
  }
}

Widget tableHeader(String text) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Text(text, style: TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.bold)),
  );
}

Widget tableCell(Widget child) {
  return Padding(
    padding: const EdgeInsets.all(14.0),
    child: child,
  );
}