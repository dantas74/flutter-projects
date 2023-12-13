import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  final List<Color> colors;

  const DefaultLayout({
    required this.child,
    super.key,
    this.colors = const [
      Color.fromARGB(255, 26, 2, 80),
      Color.fromARGB(255, 45, 7, 98),
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
      ),
      child: child,
    );
  }
}
