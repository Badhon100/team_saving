import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.height,
    required this.width,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final double height;
  final double width;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
        filled: true,
        fillColor: Colors.white70,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white),
        ),
        obscureText: obscureText,
      ),
    );
  }
}