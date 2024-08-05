// /*
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class AddUpdatePage extends StatefulWidget {
//   @override
//   _AddUpdatePageState createState() => _AddUpdatePageState();
// }

// class _AddUpdatePageState extends State<AddUpdatePage> {
//   File? _image;

//   Future<void> _pickImage(ImageSource source) async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? image = await _picker.pickImage(source: source);

//     if (image != null) {
//       setState(() {
//         _image = File(image.path);
//       });
//     } else {
//       print('No image selected.');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios_new, color: Colors.blue, size: 20),
//           onPressed: () {},
//         ),
//         title: Text('Add Product'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(height: 16),
//               _image == null
//                   ? Text('No image selected.')
//                   : Image.file(_image!),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () => _pickImage(ImageSource.gallery),
//                 child: Text('Pick Image from Gallery'),
//               ),
//               ElevatedButton(
//                 onPressed: () => _pickImage(ImageSource.camera),
//                 child: Text('Capture Image with Camera'),
//               ),
//               SizedBox(height: 20),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Text('Name'),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   TextField(
//                     decoration: InputDecoration(
//                       fillColor: Colors.grey,
//                       filled: true,
//                       border: InputBorder.none,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Row(
//                     children: [
//                       Text('Category'),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   TextField(
//                     decoration: InputDecoration(
//                       fillColor: Colors.grey,
//                       filled: true,
//                       border: InputBorder.none,
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Row(
//                     children: [
//                       Text('Price'),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   TextField(
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       fillColor: Colors.grey,
//                       filled: true,
//                       border: InputBorder.none,
//                       suffix: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8),
//                         child: Text(
//                           '\$',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Row(
//                     children: [
//                       Text('Description'),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   TextField(
//                     maxLines: 6,
//                     decoration: InputDecoration(
//                       fillColor: Colors.grey,
//                       filled: true,
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//               SizedBox(
//                 height: 50,
//                 width: 500,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: const Text('ADD'),
//                 ),
//               ),
//               SizedBox(height: 16),
//               SizedBox(
//                 height: 50,
//                 width: 500,
//                 child: OutlinedButton(
//                   onPressed: () {},
//                   child: Text(
//                     'DELETE',
//                     style: TextStyle(color: Colors.red),
//                   ),
//                   style: OutlinedButton.styleFrom(
//                     side: BorderSide(color: Colors.red),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// */
// /*
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// class MyImagePicker extends StatefulWidget {
//   @override
//   _MyImagePickerState createState() => _MyImagePickerState();
// }

// class _MyImagePickerState extends State<MyImagePicker> {
//   File? _image;

//   Future<void> _pickImage(ImageSource source) async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? image = await _picker.pickImage(source: source);

//     if (image != null) {
//       setState(() {
//         _image = File(image.path);
//       });
//     } else {
//       print('No image selected.');
//     }
//   }
// }

// class AddUpdatePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Container(
//           padding: EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: Colors.white,
//           ),
//           child: IconButton(
//             icon: Icon(Icons.arrow_back_ios_new, color: Colors.blue, size: 20),
//             onPressed: () {},
//           ),
//         ),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Add Product',
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               SizedBox(height: 16),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   _image == null
//                 ? Text('No image selected.')
//                 : Image.file(_image!),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => _pickImage(ImageSource.gallery),
//               child: Text('Pick Image from Gallery'),
//             ),
//             ElevatedButton(
//               onPressed: () => _pickImage(ImageSource.camera),
//               child: Text('Capture Image with Camera'),
//             ),
//                   Row(
//                     children: [
//                       Text('Name'),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   TextField(
//                       decoration: InputDecoration(
//                           fillColor: Colors.grey,
//                           filled: true,
//                           border: InputBorder.none)),
//                   SizedBox(height: 16),
//                   Row(
//                     children: [
//                       Text('Category'),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   TextField(
//                       decoration: InputDecoration(
//                           fillColor: Colors.grey,
//                           filled: true,
//                           border: InputBorder.none)),
//                   SizedBox(height: 16),
//                   Row(
//                     children: [
//                       Text('Price'),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   TextField(
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       fillColor: Colors.grey,
//                       filled: true,
//                       border: InputBorder.none,
//                       suffix: Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 8), // Adjust padding if needed
//                         child: Text(
//                           '\$', // Dollar sign
//                           style: TextStyle(
//                               color: Colors.black), // Adjust color if needed
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 16),
//                   Row(
//                     children: [
//                       Text('Description'),
//                     ],
//                   ),
//                   SizedBox(height: 16),
//                   TextField(
//                       maxLines: 6,
//                       decoration: InputDecoration(
//                           fillColor: Colors.grey,
//                           filled: true,
//                           border: InputBorder.none)),
//                 ],
//               ),
//               SizedBox(height: 16),
//               SizedBox(
//                 height: 50,
//                 width: 500,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     foregroundColor: Colors.white, // White text color
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(
//                           12), // Adjust the radius to get the desired curvature
//                     ),
//                   ),
//                   child: const Text('ADD'),
//                 ),
//               ),
//               SizedBox(height: 16),
//               SizedBox(
//                 height: 50,
//                 width: 500, // Specify height // Specify width
//                 child: OutlinedButton(
//                   onPressed: () {},
//                   child: Text(
//                     'DELETE',
//                     style: TextStyle(color: Colors.red),
//                   ),
//                   style: OutlinedButton.styleFrom(
//                     side: BorderSide(color: Colors.red),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// */

// // import 'package:flutter/material.dart';
// // import 'package:task_6/upload_image.dart';

// // class AddUpdatePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back_ios_new, color: Colors.blue, size: 20),
// //           onPressed: () {},
// //         ),
// //         title: Text(
// //           'Add Product',
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: EdgeInsets.all(16.0),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.start,
// //             children: [
// //               SizedBox(height: 16),
// //               imageUploadWidget(), // Add the imageUploadWidget() here
// //               SizedBox(height: 16),
// //               SizedBox(height: 16),
// //               Column(
// //                 mainAxisAlignment: MainAxisAlignment.start,
// //                 children: [
// //                   Row(
// //                     children: [
// //                       Text('Name'),
// //                     ],
// //                   ),
// //                   SizedBox(height: 16),
// //                   TextField(
// //                       decoration: InputDecoration(
// //                     fillColor: const Color.fromRGBO(243, 243, 243, 1),
// //                     filled: true,
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(12), // Border radius
// //                       borderSide: BorderSide.none, // No border
// //                     ),
// //                     enabledBorder: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(
// //                           12), // Border radius when enabled
// //                       borderSide: BorderSide.none, // No border
// //                     ),
// //                     focusedBorder: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(
// //                           12), // Border radius when focused
// //                       borderSide: BorderSide.none, // No border
// //                     ),
// //                   )),
// //                   SizedBox(height: 16),
// //                   Row(
// //                     children: [
// //                       Text('Category'),
// //                     ],
// //                   ),
// //                   SizedBox(height: 16),
// //                   TextField(
// //                       decoration: InputDecoration(
// //                     fillColor: const Color.fromRGBO(243, 243, 243, 1),
// //                     filled: true,
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(12), // Border radius
// //                       borderSide: BorderSide.none, // No border
// //                     ),
// //                     enabledBorder: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(
// //                           12), // Border radius when enabled
// //                       borderSide: BorderSide.none, // No border
// //                     ),
// //                     focusedBorder: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(
// //                           12), // Border radius when focused
// //                       borderSide: BorderSide.none, // No border
// //                     ),
// //                   )),
// //                   SizedBox(height: 16),
// //                   Row(
// //                     children: [
// //                       Text('Price'),
// //                     ],
// //                   ),
// //                   SizedBox(height: 16),
// //                   TextField(
// //                     keyboardType: TextInputType.number,
// //                     decoration: InputDecoration(
// //                       fillColor: const Color.fromRGBO(243, 243, 243, 1),
// //                       filled: true,
// //                       border: OutlineInputBorder(
// //                         borderRadius:
// //                             BorderRadius.circular(12), // Border radius
// //                         borderSide: BorderSide.none, // No border
// //                       ),
// //                       enabledBorder: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(
// //                             12), // Border radius when enabled
// //                         borderSide: BorderSide.none, // No border
// //                       ),
// //                       focusedBorder: OutlineInputBorder(
// //                         borderRadius: BorderRadius.circular(
// //                             12), // Border radius when focused
// //                         borderSide: BorderSide.none, // No border
// //                       ),
// //                       suffix: Padding(
// //                         padding: EdgeInsets.symmetric(
// //                             horizontal: 8), // Adjust padding if needed
// //                         child: Text(
// //                           '\$', // Dollar sign
// //                           style: TextStyle(
// //                               color: Colors.black), // Adjust color if needed
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(height: 16),
// //                   Row(
// //                     children: [
// //                       Text('Description'),
// //                     ],
// //                   ),
// //                   SizedBox(height: 16),
// //                   TextField(
// //                       maxLines: 6,
// //                       decoration: InputDecoration(
// //                         fillColor: const Color.fromRGBO(243, 243, 243, 1),
// //                         filled: true,
// //                         border: OutlineInputBorder(
// //                           borderRadius:
// //                               BorderRadius.circular(12), // Border radius
// //                           borderSide: BorderSide.none, // No border
// //                         ),
// //                         enabledBorder: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(
// //                               12), // Border radius when enabled
// //                           borderSide: BorderSide.none, // No border
// //                         ),
// //                         focusedBorder: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(
// //                               12), // Border radius when focused
// //                           borderSide: BorderSide.none, // No border
// //                         ),
// //                       )),
// //                 ],
// //               ),
// //               SizedBox(height: 16),
// //               SizedBox(
// //                 height: 50,
// //                 width: 500,
// //                 child: ElevatedButton(
// //                   onPressed: () {},
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: Colors.blue,
// //                     foregroundColor: Colors.white, // White text color
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(
// //                           12), // Adjust the radius to get the desired curvature
// //                     ),
// //                   ),
// //                   child: const Text('ADD'),
// //                 ),
// //               ),
// //               SizedBox(height: 16),
// //               SizedBox(
// //                 height: 50,
// //                 width: 500, // Specify height // Specify width
// //                 child: OutlinedButton(
// //                   onPressed: () {},
// //                   child: Text(
// //                     'DELETE',
// //                     style: TextStyle(color: Colors.red),
// //                   ),
// //                   style: OutlinedButton.styleFrom(
// //                     side: BorderSide(color: Colors.red),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                     ),
// //                   ),
// //                 ),
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }


// // import 'package:flutter/material.dart';
// // import 'dart:io';
// // import 'package:task_6/upload_image.dart'; // Adjust the import based on your file structure

// // class AddUpdatePage extends StatefulWidget {
// //   @override
// //   _AddUpdatePageState createState() => _AddUpdatePageState();
// // }

// // class _AddUpdatePageState extends State<AddUpdatePage> {
// //   File? _selectedImage;

// //   void _handleImagePicked(File imageFile) {
// //     setState(() {
// //       _selectedImage = imageFile;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back_ios_new, color:  Color.fromARGB(255, 54, 104, 255), size: 20),
// //           onPressed: () {Navigator.pop(context);},
// //         ),
// //         title: Text(
// //           'Add Product',
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: EdgeInsets.all(16.0),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.start,
// //             children: [
// //               SizedBox(height: 16),
// //               imageUploadWidget(_handleImagePicked), // Pass the callback
// //               SizedBox(height: 16),
// //               _selectedImage != null
// //                 ? Image.file(_selectedImage!)
// //                 : Text('No image selected.'),
// //               SizedBox(height: 16),
// //               Row(
// //                 children: [
// //                   Text('Name'),
// //                 ],
// //               ),
// //               SizedBox(height: 16),
// //               TextField(
// //                 decoration: InputDecoration(
// //                   fillColor: const Color.fromRGBO(243, 243, 243, 1),
// //                   filled: true,
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide: BorderSide.none,
// //                   ),
// //                   enabledBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide: BorderSide.none,
// //                   ),
// //                   focusedBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide: BorderSide.none,
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: 16),
// //               Row(
// //                 children: [
// //                   Text('Category'),
// //                 ],
// //               ),
// //               SizedBox(height: 16),
// //               TextField(
// //                 decoration: InputDecoration(
// //                   fillColor: const Color.fromRGBO(243, 243, 243, 1),
// //                   filled: true,
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide: BorderSide.none,
// //                   ),
// //                   enabledBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide: BorderSide.none,
// //                   ),
// //                   focusedBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide: BorderSide.none,
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: 16),
// //               Row(
// //                 children: [
// //                   Text('Price'),
// //                 ],
// //               ),
// //               SizedBox(height: 16),
// //               TextField(
// //                 keyboardType: TextInputType.number,
// //                 decoration: InputDecoration(
// //                   fillColor: const Color.fromRGBO(243, 243, 243, 1),
// //                   filled: true,
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide: BorderSide.none,
// //                   ),
// //                   enabledBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide: BorderSide.none,
// //                   ),
// //                   focusedBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide: BorderSide.none,
// //                   ),
// //                   suffix: Padding(
// //                     padding: EdgeInsets.symmetric(horizontal: 8),
// //                     child: Text(
// //                       '\$', // Dollar sign
// //                       style: TextStyle(color: Colors.black),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: 16),
// //               Row(
// //                 children: [
// //                   Text('Description'),
// //                 ],
// //               ),
// //               SizedBox(height: 16),
// //               TextField(
// //                 maxLines: 6,
// //                 decoration: InputDecoration(
// //                   fillColor: const Color.fromRGBO(243, 243, 243, 1),
// //                   filled: true,
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide: BorderSide.none,
// //                   ),
// //                   enabledBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide: BorderSide.none,
// //                   ),
// //                   focusedBorder: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12),
// //                     borderSide: BorderSide.none,
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: 16),
// //               SizedBox(
// //                 height: 50,
// //                 width: 500,
// //                 child: ElevatedButton(
// //                   onPressed: () {},
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor:  Color.fromARGB(255, 54, 104, 255),
// //                     foregroundColor: Colors.white,
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                     ),
// //                   ),
// //                   child: const Text('ADD'),
// //                 ),
// //               ),
// //               SizedBox(height: 16),
// //               SizedBox(
// //                 height: 50,
// //                 width: 500,
// //                 child: OutlinedButton(
// //                   onPressed: () {},
// //                   child: Text(
// //                     'DELETE',
// //                     style: TextStyle(color: Colors.red),
// //                   ),
// //                   style: OutlinedButton.styleFrom(
// //                     side: BorderSide(color: Colors.red),
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(12),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }


// // boxShadow: [ BoxShadow(
//             //             color: Colors.white60,
//             //             offset: const Offset(
//             //               5.0,
//             //               5.0,
//             //             ),
//             //             blurRadius: 10.0,
//             //             spreadRadius: 2.0,
//             //           ),],
            
      
//             // border: Border.all(
//             //   color: Colors.grey.withOpacity(0.3), // Light border color
//             //   width: 1, // Border width
//             // ),
        

// import 'dart:io';

// import 'package:flutter/material.dart';

// import 'upload_image.dart'; 

// import 'package:flutter/widgets.dart';
// import 'package:task_6/home_page.dart';
// import 'package:task_6/image_container.dart';
// import 'dart:io';
// import 'package:task_6/upload_image.dart';
// import 'product.dart'; 
// import 'package:provider/provider.dart';
// import 'product_provider.dart'; // Import your ProductProvider

// class AddUpdatePage extends StatefulWidget {
//   AddUpdatePage({super.key});
//   TextEditingController _name = new TextEditingController();
//   TextEditingController _category = new TextEditingController();
//   TextEditingController _description = new TextEditingController();
//   TextEditingController _price = new TextEditingController();
//   File? _selectedImage;

//   @override
//   _AddUpdatePageState createState() => _AddUpdatePageState();
// }

// class _AddUpdatePageState extends State<AddUpdatePage> {
//   File? _selectedImage;

//   void _handleImagePicked(File imageFile) {
//     setState(() {
//       _selectedImage = imageFile;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new, color: Color.fromARGB(255, 54, 104, 255), size: 20),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text('Add Product'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 16),
//               ImageUploadWidget(
//                 onImagePicked: _handleImagePicked,
//                 imageFile: _selectedImage,
//               ), 
//               SizedBox(height: 16),
//               Text('Name', style: TextStyle(fontSize: 16)),
//               SizedBox(height: 16),
//               TextField(
//                 controller: _name,
//                 decoration: InputDecoration(
//                   fillColor: const Color.fromRGBO(243, 243, 243, 1),
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text('Category', style: TextStyle(fontSize: 16)),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: _category,
//                 decoration: InputDecoration(
//                   fillColor: const Color.fromRGBO(243, 243, 243, 1),
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text('Price', style: TextStyle(fontSize: 16)),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: _price,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   fillColor: const Color.fromRGBO(243, 243, 243, 1),
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                   suffix: const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 8),
//                     child: Text(
//                       '\$', 
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Text('Description', style: TextStyle(fontSize: 16)),
//               const SizedBox(height: 16),
//               TextField(
//                 controller: _description,
//                 maxLines: 6,
//                 decoration: InputDecoration(
//                   fillColor: const Color.fromRGBO(243, 243, 243, 1),
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               SizedBox(
//                 height: 50,
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {final product = Product(
//     name: _name.text,
//     category: _category.text,
//     price: int.tryParse(_price.text) ?? 0,
//     description: _description.text,
//     imageFile: _selectedImage,
//   );

//   Navigator.pop(context, product);},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 54, 104, 255),
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: const Text('ADD'),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               SizedBox(
//                 height: 50,
//                 width: double.infinity,
//                 child: OutlinedButton(
//                   onPressed: () {},
//                   style: OutlinedButton.styleFrom(
//                     side: const BorderSide(color: Colors.red),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: const Text(
//                     'DELETE',
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }