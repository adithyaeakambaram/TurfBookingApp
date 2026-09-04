import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class otpbox extends StatelessWidget {
  const otpbox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      height: 55,
      child: TextField(
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
