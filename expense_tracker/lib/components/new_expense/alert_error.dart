import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewExpenseAlertError extends StatelessWidget {
  final bool isIOS;

  const NewExpenseAlertError({
    super.key,
    this.isIOS = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isIOS) {
      return CupertinoAlertDialog(
        title: const Text('Invalid input'),
        content: const Text(
            'Please make sure a valid title, amount, date and category was entered'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: const Text('Okay'),
          ),
        ],
      );
    }

    return AlertDialog(
      title: const Text('Invalid input'),
      content: const Text(
          'Please make sure a valid title, amount, date and category was entered'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: const Text('Okay'),
        ),
      ],
    );
  }
}
