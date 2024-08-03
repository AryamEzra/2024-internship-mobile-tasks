
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';

// Widget imageUploadWidget(void Function(File) onImagePicked) {
//   return GestureDetector(
//     onTap: () async {
//       final picker = ImagePicker();
//       final pickedFile = await picker.pickImage(
//         source: ImageSource.gallery,
//         imageQuality: 80,
//       );

//       if (pickedFile != null) {
//         File imageFile = File(pickedFile.path);
//         onImagePicked(imageFile); // Use the callback to pass the image
//       }
//     },
//     child: Container(
//       height: 300,
//       width: 400,
//       decoration: BoxDecoration(
//         color:  const Color.fromRGBO(243, 243, 243, 1),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       padding: EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.image, color: Colors.black, size: 30),
//               SizedBox(width: .0),
//               Text(
//                 'Upload image',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageUploadWidget extends StatefulWidget {
  final void Function(File) onImagePicked;

  const ImageUploadWidget({
    Key? key,
    required this.onImagePicked,
  }) : super(key: key);

  @override
  _ImageUploadWidgetState createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  File? _imageFile;

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
          setState(() {
            _imageFile = File(pickedFile.path);
          });
          widget.onImagePicked(_imageFile!);
        }
      },
      child: Container(
        height: 300,
        width: 400,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(243, 243, 243, 1),
          borderRadius: BorderRadius.circular(10),
          image: _imageFile != null
              ? DecorationImage(
                  image: FileImage(_imageFile!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        padding: const EdgeInsets.all(8.0),
        child: _imageFile == null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.image, color: Colors.black, size: 30),
                    SizedBox(width: 10.0),
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

