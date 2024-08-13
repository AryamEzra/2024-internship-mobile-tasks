import 'package:flutter/material.dart';
class AddPage extends StatelessWidget {
  const AddPage({super.key});

  // final ProductAddBloc productAddBloc;

  // AddPage(this.productAddBloc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: Color.fromARGB(255, 54, 104, 255), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Add Product'),
        centerTitle: true,
      ),
      // body: BlocProvider(
      //   create: (context) => productAddBloc,
      //   child: ProductAddForm(),
      // ),
    );
  }
}