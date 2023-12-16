import 'package:flutter/material.dart';
import 'package:quiz_app/components/atoms/default_text.dart';

class DefaultTextButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;

  const DefaultTextButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: DefaultText(
        buttonText,
        fontSize: 20,
      ),
    );
  }
}
