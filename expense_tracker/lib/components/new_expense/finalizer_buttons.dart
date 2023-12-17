import 'package:flutter/material.dart';

class NewExpenseFinalizerButtons {
  final void Function() cancelAddingExpense;
  final void Function() submitExpense;

  const NewExpenseFinalizerButtons({
    required this.cancelAddingExpense,
    required this.submitExpense,
  });

  List<Widget> get buttons {
    return [
      TextButton(
        onPressed: cancelAddingExpense,
        child: const Text('Cancel'),
      ),
      ElevatedButton(
        onPressed: submitExpense,
        child: const Text('Save expense'),
      )
    ];
  }
}
