import 'package:flutter/material.dart';

class UpdateButton extends StatelessWidget {
  final dynamic product;
  final int index;

  const UpdateButton({super.key, required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/update', arguments: {'product': product, 'index': index});
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 54, 104, 255),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text('UPDATE'),
    );
  }
}
