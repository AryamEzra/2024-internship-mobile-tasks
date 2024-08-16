import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product.dart';
import 'product_provider.dart';
import 'upload_image.dart';

class UpdatePage extends StatefulWidget {
  final Product product;
  final int index;

  const UpdatePage({super.key, required this.product, required this.index});


  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _category = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _price = TextEditingController();
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _name.text = widget.product.name;
    _category.text = widget.product.category;
    _description.text = widget.product.description;
    _price.text = widget.product.price;
    _selectedImage = widget.product.imageFile;
  }

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
        title: const Text('Update Product'),
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
                    final updatedProduct = Product(
                      name: _name.text,
                      category: _category.text,
                      price: _price.text,
                      description: _description.text,
                      imageFile: _selectedImage,
                    );

                    Provider.of<ProductProvider>(context, listen: false)
                        .updateProduct(widget.index, updatedProduct);

                    Navigator.pop(context, updatedProduct);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 54, 104, 255),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('UPDATE'),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Provider.of<ProductProvider>(context, listen: false)
                        .deleteProduct(widget.index);
                    Navigator.pop(context);
                  },
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
