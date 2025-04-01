import 'package:adminpanel/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class CustomPDFPicker extends StatefulWidget {
  final String label;
  final double length;
  final double breadth;
  final Color? backgroundColor;
  final void Function(File?) onPDFSelected;

  const CustomPDFPicker({
    Key? key,
    required this.onPDFSelected,
    this.label = "Tap to Select PDF",
    this.length = 100,
    this.breadth = 200,
    this.backgroundColor,
  }) : super(key: key);

  @override
  _CustomPDFPickerState createState() => _CustomPDFPickerState();
}

class _CustomPDFPickerState extends State<CustomPDFPicker> {
  File? _selectedPDF;

  Future<void> _pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _selectedPDF = File(result.files.single.path!);
      });
      widget.onPDFSelected(_selectedPDF);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: _pickPDF,
          child: Card(
            elevation: 10,
            child: Container(
              height: widget.length,
              width: widget.breadth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:widget.backgroundColor ?? const Color.fromARGB(130, 189, 188, 188) ),
              child: _selectedPDF == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.picture_as_pdf, size: 40, color: Colors.grey),
                        Text(widget.label),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.picture_as_pdf, size: 40, color:DColors.success),
                        Text(
                          _selectedPDF!.path.split('/').last, 
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
            ),
          ),
        );
      
  }
}