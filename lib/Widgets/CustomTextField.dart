import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  final String hinText;
  final IconData icon;
  const Customtextfield({super.key, required this.hinText, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: TextField(
        decoration: InputDecoration(
          hintText: hinText,
          prefixIcon: Icon(icon, color: Colors.green),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.green, width: 2),
          ),
        ),
      ),
    );
  }
}
