import 'package:adminpanel/common/layouts/tables/pagination_table.dart';
import 'package:adminpanel/core/constants/fonts.dart';
import 'package:adminpanel/core/constants/input%20fields/basic_input.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/features/notes/add%20notes/presentation/screens/add_notes_screen.dart';
import 'package:adminpanel/features/notes/all%20notes/presentation/screens/responsive%20screens/widgets/outline_toggleButton.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class AllNotesDesktop extends StatefulWidget {
  const AllNotesDesktop({super.key});

  @override
  State<AllNotesDesktop> createState() => _AllNotesDesktopState();
}

class _AllNotesDesktopState extends State<AllNotesDesktop> {

  bool isNotesListSelected = true;
  TextEditingController searchController = TextEditingController();

   //sample data 
    List<Map<String, dynamic>> sampleData = [
      {'Degree': 'B.E / B.Tech' , 'Branch':'Aerospace' , 'Year':'II' , 'Subject code ':'//////' ,
       'Subject title':' //// ', 'Uploaded By': 'Anonymous', 'Uploaded on': '01/04/2025', 'Filesize':'413kb'},  //column spacing must be adjusted


     {'Degree': 'M.E / M.Tech' , 'Branch':'Marine' , 'Year':'IV' , 'Subject code ':'//////' , 
     'Subject title':' //// ', 'Uploaded By': 'Unknown', 'Uploaded on': '2/04/2025', 'Filesize':'780kb'},
      
    ];

    List <Map<String,dynamic>> filteredNotes = [];


    //column labelling  
    List<DataColumn2> columns = [
      DataColumn2(label: Text('Degree')),
      DataColumn2(label: Text('Branch')),
      DataColumn2(label: Text('Year')),
      DataColumn2(label: Text('Subject code')),
      DataColumn2(label: Text('Subject title')),
      DataColumn2(label: Text('Uploaded by')),
      DataColumn2(label: Text('Uploaded on')),
      DataColumn2(label: Text('File size')),
      DataColumn2(label: Text('Actions')),
    ];


    void initState() {
    super.initState();
    filteredNotes = List.from(sampleData);
  }

    void filter(String query){
      if (query.isEmpty){
        setState(() {
          filteredNotes = List.from(sampleData);
        });
      }
      else {
        setState(() {
          filteredNotes = sampleData.where((note){
            return note.values.any((value)=>
            value.toString().toLowerCase().contains(query.toLowerCase()));
          }).toList();
        });
      }
      
    }
    






  @override
  Widget build(BuildContext context) {

    SampleData datasource = SampleData(filteredNotes);
   
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("   NOTES",style: DFont.title,),
              SizedBox(height: 18),
              Row(
                children: [
                  OutlineTogglebutton(
                    length: 22,
                    width: 25,
                    curve: 30,
                    label: "Notes list", 
                    onPressed: (){
                      setState(() {
                        isNotesListSelected = true;
                      });
                    },
                    isSelected: isNotesListSelected,),

                  SizedBox(width: 18,),

                  OutlineTogglebutton(
                    length: 22,
                    width: 25,
                    curve: 30,
                    label: "Add Notes", 
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddNotesScreen()));
                    },
                    isSelected: !isNotesListSelected,),
                ],
              ),

              SizedBox(height: DSizes.lg,),
              BasicInput(
                label: "Search for notes",
                controller: searchController,
                onChanged: (value){
                  filter(value);
                },),
              SizedBox(height: DSizes.lg,),

              Container(
                            height: 500,
                            width: 1500 - 230,
                            child: DPaginationTable(
                              columnSpacing: 8, 
                              minWidth: 600, 
                              rowsPerPage: 8, 
                              source: datasource, 
                              dataRowHeight: 55, 
                              column: columns,
                              checkBox: false,)
                          )
              
            ],
          ),
        ),
      ),
    );
  }
}




//datasource 
class SampleData extends DataTableSource {
  final List<Map<String, dynamic>> data;

  SampleData(this.data);

  @override
  DataRow getRow(int index) {
    final row = data[index];
    return DataRow(cells: [
      DataCell(Text(row['Degree'].toString())),
      DataCell(Text(row['Branch'].toString())),
      DataCell(Text(row['Year'].toString())),
      DataCell(Text(row['Subject code '].toString())),
      DataCell(Text(row['Suject title'].toString())),
      DataCell(Text(row['Uploaded by'].toString())),
      DataCell(Text(row['Uploaded on'].toString())),
      DataCell(Text(row['Filesize'].toString())),
      DataCell(
        Row(
          children: [
            InkWell(
              onTap: (){},
              child: Text("VIEW    ", style: DFont.subTitle,),
            ),
            IconButton(
              icon: Icon(Icons.download),
              onPressed: () {
                print('Action for downloading ${row['Subject title']}pdf');
              },
            ),
          ],
        ),
      ),

    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

   @override
  int get selectedRowCount => 0;
}