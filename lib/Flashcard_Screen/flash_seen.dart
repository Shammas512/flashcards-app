import 'package:flashcards/GlobalWidgets/gappbar.dart';
import 'package:flutter/material.dart';

class FlashSeen extends StatelessWidget {
  final String name,content;

  const FlashSeen({super.key, required this.name, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: Gappbar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              child: Text(name,style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 10,),
          Container(
            height: 500,
            width: 350,
            child: Text(content,style: TextStyle(fontSize: 17,fontStyle: FontStyle.italic,color: Colors.black),),
          )

          ],
        ),
      ),
    );
  }
}
