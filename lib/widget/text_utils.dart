import 'package:flutter/material.dart';

class TextUtils extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? underLine;

  const TextUtils({
    super.key,
    this.fontSize,
    this.fontWeight,
    this.text,
    this.color,
    this.underLine,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: color,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        overflow: TextOverflow.clip,
      ),
    );
  }
}
