import 'package:flashcards/GlobalWidgets/gappbar.dart';
import 'package:flashcards/Provider/provider_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlashUi extends StatelessWidget {
  TextEditingController Title = TextEditingController();
  TextEditingController Content = TextEditingController();
  FlashUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Gappbar(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: double.infinity,
              child: TextField(
                controller: Title,
                style: TextStyle(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            Container(
              // color: Colors.amber,
              height: 500,

              width: 350,
              child: TextField(
                style: TextStyle(fontStyle: FontStyle.italic),
                controller: Content,
                maxLines: null,
                decoration: InputDecoration(
                    hintText: "Write in down",
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                    border: OutlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
           
          ],
        ),
      ),
     floatingActionButton:   FloatingActionButton(
              onPressed: () {
                context.read<FlashClass>().addflash(Title.text, Content.text);
                Navigator.pop(context);
              },
              child: Icon(Icons.done_outline_outlined),
            ),
    );
  }
}
