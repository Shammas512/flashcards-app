import 'package:flutter/material.dart';

class FlashClass extends ChangeNotifier {
  List <Map<String,dynamic>> flashcards = [{
    "Name" : "Microsoft Word",
    "Content" : "A Software By Microsoft"
  },
   {
    "Name" : "Bionomial Theorem",
    "Content" : "Hello Bianimial therom is the branch of MatheMatics"
  },
   {
    "Name" : "Mechanical Physics",
    "Content" : "Mechanical Physices is the branch of Physics"
  },
  
  ];
  List<Map<String, dynamic>> flashpro() => flashcards;

}
