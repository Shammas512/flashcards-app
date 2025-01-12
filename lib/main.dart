import 'package:flashcards/Flashcard_Screen/flash_ui.dart';
import 'package:flashcards/Flashcard_Screen/flashcarda.dart';
import 'package:flashcards/Provider/provider_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FlashClass(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Flashcarda(),
    );
  }
}
