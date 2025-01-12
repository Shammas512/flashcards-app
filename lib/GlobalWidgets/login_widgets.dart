import 'package:flutter/material.dart';

class register_field extends StatelessWidget {
  TextEditingController controller;
  String text;
   register_field({super.key,required this.text,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller ,
      decoration:  InputDecoration(border: OutlineInputBorder(),
      labelText: text
      ),
    );
  }
}
