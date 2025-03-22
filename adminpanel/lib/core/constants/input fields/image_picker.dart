import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker extends StatefulWidget {
  final String label;
  final double length;
  final double breadth;
  final Color? backgroundColor;
  final String? backgroundImageUrl;
  final void Function(File?) onImageSelected;

  const CustomImagePicker({
    Key? key,
    required this.onImageSelected,
    this.label="Drag & Drop or Tap to Select Image",
    this.length=100,
    this.breadth=200,
    this.backgroundColor ,
    this.backgroundImageUrl
  }) : super(key: key);

  @override
  _CustomImagePickerState createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? _selectedImage;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      widget.onImageSelected(_selectedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        GestureDetector(
          onTap: () => _pickImage(ImageSource.gallery),
          child: Container(
            height: widget.length,
            width: widget.breadth,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              color: widget.backgroundColor?? Colors.grey[200],
              image: widget.backgroundImageUrl !=  null ?
                    DecorationImage(image: NetworkImage(widget.backgroundImageUrl!),
                    fit:BoxFit.cover) : null
            ),
            child: _selectedImage == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, size: 40, color: Colors.grey),
                      Text(widget.label),
                    ],
                  )
                : Image.file(
                    _selectedImage!,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ],
    );
  }
}
