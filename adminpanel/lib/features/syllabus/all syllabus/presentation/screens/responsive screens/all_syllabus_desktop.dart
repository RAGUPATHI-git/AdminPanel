import 'package:adminpanel/core/constants/button_styles/elevated_buttons.dart';
import 'package:adminpanel/core/constants/fonts.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/features/syllabus/all%20syllabus/presentation/screens/responsive%20screens/widgets/toggleButton.dart';
import 'package:flutter/material.dart';

class AllSyllabusDesktop extends StatefulWidget {
  const AllSyllabusDesktop({super.key});

  @override
  State<AllSyllabusDesktop> createState() => _AllSyllabusDesktopState();
}

class _AllSyllabusDesktopState extends State<AllSyllabusDesktop> {
  final List<String> syllabus = [];
  final GlobalKey<AnimatedListState> key = GlobalKey();

  void addItem() {
    setState(() {
    syllabus.insert(0, "Semester : ${syllabus.length + 1} - (Subject code) Subject title");
    key.currentState!.insertItem(0, duration: Duration(milliseconds: 300));
    });
  }

  void removeItem(int index) {
    key.currentState!.removeItem(index, (_, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.all(10),
          color: Color.fromARGB(139, 255, 82, 82),
          child: ListTile(
            title: Text("Deleted", style: TextStyle(fontSize: 15)),
          ),
        ),
      );
    }, duration: const Duration(milliseconds: 400));
    setState(() {
      syllabus.removeAt(index);
      });
  }

  void archieveItem(int index) {
    key.currentState!.removeItem(index, (_, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.all(10),
          color:  Color.fromRGBO(8, 103, 255, 0.501),
          child: ListTile(
            title: Text("Archieved", style: TextStyle(fontSize: 15)),
          ),
        ),
      );
    }, duration: const Duration(milliseconds: 400));
    setState(() {
      syllabus.removeAt(index);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("SYLLABUS", style: DFont.title),
                    ElevatedButton.icon(
                      onPressed: () {
                        addItem();
                      },
                      icon: Icon(Icons.add, color: Colors.white),
                      label: Text("ADD SYLLABUS"),
                      style: DElevatedButtons.customelevatedButton,
                    ),
                  ],
                ),
                SizedBox(height: DSizes.md),
                Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomToggleButton(
                              label: "          ALL   ${syllabus.length}          ",
                              onPressed: () {},
                            ),
                            
                            CustomToggleButton(
                              label: "            NEW           ",
                              onPressed: () {},
                            ),
                            
                            CustomToggleButton(
                              label: "        ARCHIVED        ",
                              onPressed: () {},
                            ),
                            
                            CustomToggleButton(
                              label: "         DELETED         ",
                              onPressed: () {},
                            ),

                            
                            VerticalDivider(thickness: 1,color:Colors.grey, indent: 1,endIndent: 1,), //not appearing
                            

                            CustomToggleButton(
                              curve: 0,
                              length: 20,
                              width: 45,
                              label: "Filter by", 
                              onPressed: (){}),

                            

                            CustomToggleButton(
                              curve: 0,
                              length: 20,
                              width: 45,
                              label: "Clear filters", 
                              onPressed: (){})

                              
                          ],
                        ),

                        
                        SizedBox(height: DSizes.lg,),
                        Divider(thickness: 1,color: Colors.grey,),
                        SizedBox(height: DSizes.lg,),



                        SizedBox(height: 10),
                        
                        SizedBox(
                          height: 450,
                          child: AnimatedList(
                            key: key,
                            initialItemCount: syllabus.length,
                            padding: const EdgeInsets.all(10),
                            itemBuilder: (context, index, animation) {
                              return SizeTransition(
                                key: UniqueKey(),
                                sizeFactor: animation,
                                child: Card(
                                  margin: const EdgeInsets.all(10),
                                  color: Colors.white,
                                  child: ListTile(
                                    title: Text(
                                      syllabus[index],
                                      style: TextStyle(fontSize: 15,),
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.delete,color: Colors.grey),
                                          onPressed: () {
                                            removeItem(index);
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.archive,color: Colors.grey,),
                                          onPressed: () {
                                            archieveItem(index);
                                          },
                                        ),
                                      ],
                                    ),
                                    
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}