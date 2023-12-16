import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final List<Color> colors;
  final Widget child;

  const DefaultLayout({
    super.key,
    required this.child,
    this.colors = const [
      Color.fromARGB(255, 78, 13, 151),
      Color.fromARGB(255, 107, 15, 168),
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
