import 'package:adminpanel/core/constants/button_styles/elevated_buttons.dart';
import 'package:adminpanel/core/constants/input%20fields/basic_input.dart';
import 'package:adminpanel/core/constants/input%20fields/image_picker.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class MobileEventDialog extends StatefulWidget {
  final String title;
  final String date;
  final String posterUrl;
  final Function(String, String, String) onEdit;
  final Function() onDelete;

  const MobileEventDialog({
    Key? key,
    required this.title,
    required this.date,
    required this.posterUrl,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  @override
  _MobileEventDialogState createState() => _MobileEventDialogState();
}

class _MobileEventDialogState extends State<MobileEventDialog> {
  late TextEditingController _titleController;
  late TextEditingController _dateController;
  late TextEditingController _posterUrlController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _dateController = TextEditingController(text: widget.date);
    _posterUrlController = TextEditingController(text: widget.posterUrl);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _dateController.dispose();
    _posterUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AlertDialog(
        title: Text("Edit Event"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, 
            children: [
              CustomImagePicker(
              length: 500,
              breadth: 400,
              label: " " ,
              backgroundImageUrl: _posterUrlController.text,
              onImageSelected: (value){}),
              Text("Click on the poster to edit"),
      
      
              SizedBox(height: 20), 
              BasicInput(label: 'Title', controller: _titleController),
              BasicInput(label: 'Date', controller: _dateController),
              SizedBox(height: 20), 
          
          Center(
            child: ElevatedButton(
              style: DElevatedButtons.successelevatedButton,
              onPressed: () {
                widget.onEdit(
                  _titleController.text,
                  _dateController.text,
                  _posterUrlController.text,
                );
                Navigator.of(context).pop();
              },
              child: Text('  Edit Event   '),
            ),
          ),
          SizedBox(height: DSizes.lg,),
          Center(
            child: ElevatedButton(
              style: DElevatedButtons.dangerelevatedButton,
              onPressed: () {
                widget.onDelete();
                Navigator.of(context).pop();
              },
              child: Text('Delete Event'),
            ),
          ),
          SizedBox(height: DSizes.lg,),
          Center(
            child: ElevatedButton(
              style: DElevatedButtons.customelevatedButton,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('     Cancel     '),
            ),
          ),
          SizedBox(height: DSizes.lg,),
          ],
          ),
        ),
      ),
    );
  }
}