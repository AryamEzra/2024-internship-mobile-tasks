import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_case/delete_product.dart';
import '../bloc/details_page/details_page_bloc.dart';

class DeleteButtonAdd extends StatelessWidget {

  const DeleteButtonAdd();

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.red),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        'DELETE',
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
