
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_6/home_page.dart';
import 'package:task_6/image_container.dart';
import 'dart:io';
import 'package:task_6/upload_image.dart';
import 'product.dart'; 

class AddUpdatePage extends StatefulWidget {
  const AddUpdatePage({Key? key}) : super(key: key);

  @override
  _AddUpdatePageState createState() => _AddUpdatePageState();
}

class _AddUpdatePageState extends State<AddUpdatePage> {
  TextEditingController _name = new TextEditingController();
  TextEditingController _category = new TextEditingController();
  TextEditingController _description = new TextEditingController();
  TextEditingController _price = new TextEditingController();
  File? _selectedImage;

  void _handleImagePicked(File imageFile) {
    setState(() {
      _selectedImage = imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Color.fromARGB(255, 54, 104, 255), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Add Product'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              ImageUploadWidget(
                onImagePicked: _handleImagePicked,
              ), 
              SizedBox(height: 16),
              Text('Name', style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              TextField(
                controller: _name,
                decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(243, 243, 243, 1),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Category', style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              TextField(
                controller: _category,
                decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(243, 243, 243, 1),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Price', style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              TextField(
                controller: _price,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(243, 243, 243, 1),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  suffix: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      '\$', // Dollar sign
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Description', style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              TextField(
                controller: _description,
                maxLines: 6,
                decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(243, 243, 243, 1),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {final product = Product(
    name: _name.text,
    category: _category.text,
    price: int.tryParse(_price.text) ?? 0,
    description: _description.text,
    imageFile: _selectedImage,
  );

  Navigator.pop(context, product);},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 54, 104, 255),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('ADD'),
                ),
              ),
              SizedBox(height: 16),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    'DELETE',
                    style: TextStyle(color: Colors.red),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

