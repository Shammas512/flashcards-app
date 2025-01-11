import 'package:flashcards/GlobalWidgets/gappbar.dart';
import 'package:flutter/material.dart';

class FlashUi extends StatelessWidget {
  const FlashUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Gappbar(),
      body: Padding(padding: EdgeInsets.all(10),
      child:Column(
         children: [
          Container(
           
          ),
         ],

      ) ,
      
      ),
    );
    
  }
}