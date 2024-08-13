import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/details_page/details_page_bloc.dart';

class DeleteButton extends StatelessWidget {
  final int index;

  const DeleteButton({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        BlocProvider.of<DetailsPageBloc>(context).add(DeleteDetailsEvent(index as String));
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
