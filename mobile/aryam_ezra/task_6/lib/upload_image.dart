import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadWidget extends StatefulWidget {
  final File? imageFile;
  final void Function(File) onImagePicked;

  const ImageUploadWidget({
    super.key,
    required this.onImagePicked,
    this.imageFile,
  });

  @override
  _ImageUploadWidgetState createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final picker = ImagePicker();
        final pickedFile = await picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 80,
        );

        if (pickedFile != null) {
          File imageFile = File(pickedFile.path);
          widget.onImagePicked(imageFile); 
          setState(() {}); 
        }
      },
      child: Container(
        height: 300,
        width: 400,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(243, 243, 243, 1),
          borderRadius: BorderRadius.circular(10),
          image: widget.imageFile != null
              ? DecorationImage(
                  image: FileImage(widget.imageFile!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        padding: const EdgeInsets.all(8.0),
        child: widget.imageFile == null
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image, color: Colors.black, size: 30),
                    SizedBox(width: .0),
                    Text(
                      'Upload image',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            : null,
      ),
    );
  }
}