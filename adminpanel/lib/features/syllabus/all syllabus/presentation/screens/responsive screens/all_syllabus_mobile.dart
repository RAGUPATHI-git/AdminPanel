import 'package:adminpanel/core/constants/button_styles/elevated_buttons.dart';
import 'package:adminpanel/core/constants/fonts.dart';
import 'package:adminpanel/core/constants/input%20fields/basic_input.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/features/syllabus/all%20syllabus/presentation/screens/responsive%20screens/widgets/fill_toggleButton.dart';
import 'package:flutter/material.dart';

class AllSyllabusMobile extends StatefulWidget {
  const AllSyllabusMobile({super.key});

  @override
  State<AllSyllabusMobile> createState() => _AllSyllabusMobileState();
}

class _AllSyllabusMobileState extends State<AllSyllabusMobile> {
  final List<String> syllabus = [];
  final List<String> filteredSyllabus=[];
  final List<String> deletedSyllabus = []; 
  final List<String> archivedSyllabus = []; 
  final List<String> newSyllabus = []; 
  String currentView = 'ALL';
  String selectedToggle = 'ALL';
  final GlobalKey<AnimatedListState> key = GlobalKey();
  final TextEditingController searchController = TextEditingController();

  void initState(){
    super.initState();
    filteredSyllabus.addAll(syllabus);
    searchController.addListener((){
      _filteredSyllabus();
    });

  }

  void addItem() {
    setState(() {
    String newSyllabusItem = "Semester : ${syllabus.length + 1} - (Subject code) Subject title";
    syllabus.insert(0, newSyllabusItem);
    filteredSyllabus.insert(0, newSyllabusItem);
    newSyllabus.insert(0,newSyllabusItem);
    key.currentState!.insertItem(0, duration: Duration(milliseconds: 300));
    });
  }

  void removeItem(int index) {
    if (index < 0 || index >= filteredSyllabus.length) return;
    int originalIndex = syllabus.indexOf(filteredSyllabus[index]);
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
      deletedSyllabus.add(syllabus[originalIndex]);
      newSyllabus.remove(syllabus[originalIndex]);
      syllabus.removeAt(originalIndex);
      filteredSyllabus.removeAt(index);
      
      
      });
  }


  void archieveItem(int index) {
    if (index < 0 || index >= filteredSyllabus.length) return;
    int originalIndex = syllabus.indexOf(filteredSyllabus[index]);
    key.currentState!.removeItem(index, (_, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.all(10),
          color:  Color.fromRGBO(8, 103, 255, 0.501),
          child: ListTile(
            title: Text("Archived", style: TextStyle(fontSize: 15)),
          ),
        ),
      );
    }, duration: const Duration(milliseconds: 400));
    setState(() {
      archivedSyllabus.add(syllabus[originalIndex]);      //order of the states very important
      newSyllabus.remove(syllabus[originalIndex]);
      syllabus.removeAt(originalIndex);
      filteredSyllabus.removeAt(index);
      
      
      });
  }

   void _filteredSyllabus() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredSyllabus.clear();
      if (currentView == 'ALL') {
        filteredSyllabus.addAll(syllabus.where((item) => item.toLowerCase().contains(query)));
      } else if (currentView == 'NEW') {
        filteredSyllabus.addAll(newSyllabus.where((item) => item.toLowerCase().contains(query)));
      } else if (currentView == 'ARCHIVED') {
        filteredSyllabus.addAll(archivedSyllabus.where((item) => item.toLowerCase().contains(query)));
      } else if (currentView == 'DELETED') {
        filteredSyllabus.addAll(deletedSyllabus.where((item) => item.toLowerCase().contains(query)));
      }
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
                        // Navigator.push(
                        // context,
                        // MaterialPageRoute(
                        //     builder: (context) => const AddSyllabus()));
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
                            FillToggleButton(
                              size: 13,
                              label: "  ALL   ${syllabus.length}  ",
                              onPressed: () {
                                setState(() {
                                  currentView ='ALL';
                                  selectedToggle ='ALL';
                                  filteredSyllabus.clear();
                                  filteredSyllabus.addAll(syllabus);
                                   print("Filtered Syllabus for ALL: $filteredSyllabus");   
                                });
                              },
                              isSelected: selectedToggle == 'ALL',
                            ),
                            
                            FillToggleButton(
                              size: 13,
                              label: "    NEW   ${newSyllabus.length}  ",
                              onPressed: () {
                                setState(() {
                                currentView = 'NEW';
                                selectedToggle = 'NEW';
                                filteredSyllabus.clear();
                                filteredSyllabus.addAll(newSyllabus);
                                print("Filtered Syllabus for : $filteredSyllabus");        
                              });
                              },
                              isSelected: selectedToggle == 'NEW',
                            ),
                            
                            FillToggleButton(
                              size: 13,
                              label: " ARCHIVED   ${archivedSyllabus.length} ",
                              onPressed: () {
                                setState(() {
                                currentView = 'ARCHIVED';
                                selectedToggle = 'ARCHIVED';
                                filteredSyllabus.clear();
                                filteredSyllabus.addAll(archivedSyllabus);
                                print("Filtered Syllabus for ARCHIVED: $filteredSyllabus");      // all archived and deleted syllabuses are not appearing ....but appears when searching . 
                              });
                              },
                              isSelected: selectedToggle == 'ARCHIVED',
                            ),
                            
                            FillToggleButton(
                              size: 13,
                              label: " DELETED   ${deletedSyllabus.length} ",
                              onPressed: () {
                                setState(() {
                                currentView = 'DELETED';
                                selectedToggle = 'DELETED';
                                filteredSyllabus.clear();
                                filteredSyllabus.addAll(deletedSyllabus);
                               print("Filtered Syllabus for DELETED: $filteredSyllabus");
                              });
                              },
                              isSelected: selectedToggle == 'DELETED',
                            ),

                            

                              
                          ],
                        ),

                        
                        SizedBox(height: DSizes.lg,),
                        Divider(thickness: 1,color: Colors.grey,),
                        SizedBox(height: DSizes.lg,),

                        BasicInput(
                          label: "Search for syllabus",
                          controller: searchController,),



                        SizedBox(height: 10),
                        
                        SizedBox(
                          height: 450,
                          child: AnimatedList(
                            key: key,
                            padding: const EdgeInsets.all(10),
                            itemBuilder: (context, index, animation) {
                              if (index < filteredSyllabus.length){
                                return SizeTransition(
                                sizeFactor: animation,
                                child: Card(
                                  margin: const EdgeInsets.all(10),
                                  color: Colors.white,
                                  child: ListTile(
                                    title: Text(
                                      filteredSyllabus[index],
                                      style: TextStyle(fontSize: 15,),
                                    ),
                                    trailing: (currentView == 'ARCHIVED' || currentView == 'DELETED') ? null : Row(
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
                              } // SizeTransition if condition 
                              else{
                                return SizedBox();
                              }
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