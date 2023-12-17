import 'package:flutter/material.dart';

class NewExpenseTextWidget extends StatelessWidget {
  final TextEditingController titleController;

  const NewExpenseTextWidget(this.titleController, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: titleController,
      maxLength: 50,
      decoration: const InputDecoration(
        label: Text('Title'),
      ),
    );
  }
}
