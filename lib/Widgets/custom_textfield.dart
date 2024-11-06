import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;

  const CustomTextField({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.grey[700]
          )
        ),
      ),

    );
  }
}