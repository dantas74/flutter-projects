import 'package:flutter/material.dart';

class DefaultOutlinedButton extends StatelessWidget {
  final Widget child;
  final IconData? icon;
  final void Function() onPressed;

  const DefaultOutlinedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Color.fromARGB(255, 237, 223, 252),
        ),
        icon: Icon(
          icon,
        ),
        label: child,
      );
    }

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: Color.fromARGB(255, 237, 223, 252),
      ),
      child: child,
    );
  }
}
