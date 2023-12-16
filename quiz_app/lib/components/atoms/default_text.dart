import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultText extends StatelessWidget {
  final String data;
  final double? fontSize;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final Color? color;

  const DefaultText(
    this.data, {
    super.key,
    this.fontSize,
    this.textAlign,
    this.fontWeight,
    this.color = const Color.fromARGB(255, 237, 223, 252),
  });

  @override
  Widget build(BuildContext context) {

    return Text(
      data,
      style: GoogleFonts.lato(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}
