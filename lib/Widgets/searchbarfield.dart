import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class seachbarfield extends StatelessWidget {
  final String hinttext;
  final TextEditingController? controller;
  final VoidCallback? onmictap;
  const seachbarfield({
    super.key,
    r,
    required this.hinttext,
    this.controller,
    this.onmictap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hinttext,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search, color: Colors.grey, size: 23),
            SizedBox(width: 10),
            GestureDetector(
              onTap: onmictap,
              child: Icon(Icons.mic, color: Colors.green, size: 22),
            ),

            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
