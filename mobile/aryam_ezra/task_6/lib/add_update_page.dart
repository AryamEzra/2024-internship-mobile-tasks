import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'upload_image.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'home_page.dart';
import 'image_container.dart';
import 'product.dart';
import 'product_provider.dart';// Ensure this file exists


class AddUpdatePage extends StatefulWidget {
  const AddUpdatePage({super.key});

  @override
  _AddUpdatePageState createState() => _AddUpdatePageState();
}

class _AddUpdatePageState extends State<AddUpdatePage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _category = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _price = TextEditingController();
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
          icon: const Icon(Icons.arrow_back_ios_new, color: Color.fromARGB(255, 54, 104, 255), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Add Product'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              ImageUploadWidget(
                onImagePicked: _handleImagePicked,
                imageFile: _selectedImage,
              ),
              const SizedBox(height: 16),
              const Text('Name', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              const Text('Category', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              const Text('Price', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
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
                  suffixText: '\$',
                  suffixStyle: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Description', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final product = Product(
                      name: _name.text,
                      category: _category.text,
                      price: _price.text,
                      description: _description.text,
                      imageFile: _selectedImage,
                    );

                    Provider.of<ProductProvider>(context, listen: false).addProduct(product);

                    Navigator.pop(context, product);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 54, 104, 255),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('ADD'),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'DELETE',
                    style: TextStyle(color: Colors.red),
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
