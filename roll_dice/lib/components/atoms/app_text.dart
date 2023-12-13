import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String data;

  const AppText(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28,
      ),
    );
  }
}
