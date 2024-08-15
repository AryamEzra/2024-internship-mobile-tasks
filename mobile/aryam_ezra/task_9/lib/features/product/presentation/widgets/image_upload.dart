import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageUploadWidget extends StatelessWidget {
  final Function(File) onImagePicked;
  final File? imageFile;

  const ImageUploadWidget({
    Key? key,
    required this.onImagePicked,
    this.imageFile,
  }) : super(key: key);

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      onImagePicked(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (imageFile != null)
          Image.file(
            imageFile!,
            height: 200,
          ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => _pickImage(context, ImageSource.gallery),
              child: const Text('Select from Gallery'),
            ),
            ElevatedButton(
              onPressed: () => _pickImage(context, ImageSource.camera),
              child: const Text('Take a Photo'),
            ),
          ],
        ),
      ],
    );
  }
}
