import 'dart:convert';

import 'package:flashcards/Flashcard_Screen/flash_seen.dart';
import 'package:flashcards/Flashcard_Screen/flash_ui.dart';
import 'package:flashcards/GlobalWidgets/gappbar.dart';
import 'package:flashcards/GlobalWidgets/gcont.dart';
import 'package:flashcards/Provider/provider_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Flashcarda extends StatefulWidget {
  final String id;
  Flashcarda({super.key, required this.id});

  @override
  State<Flashcarda> createState() => _FlashcardaState();
}

class _FlashcardaState extends State<Flashcarda> {
  String name = "";

  String email = "";

  Future getapi() async {
    final responce = await http.get(Uri.parse(
        "https://crudcrud.com/api/cedfb5625fa0450d8e20487f24dc5db6/unicorns/${widget.id}"));
    var data = jsonDecode(responce.body);
    if (responce.statusCode == 200) {
      print("ok");
    } else {
      print("Sorry");
    }
    print(data["name"]);
    setState(() {
      name = data["name"];
      email = data["email"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getapi();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: Gappbar(),
      body: Consumer<FlashClass>(
        builder: (ctx, provider, _) {
          var data = provider.flashpro();
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(height: 20,),
                ListTile(
                  leading: CircleAvatar(
                    radius: 23,
                    backgroundColor: Colors.red,
                  ),
                  title: Text(
                    name,
                    style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  ),
                  subtitle: Text(
                    email,
                    style: TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: SizedBox(
                            height: height * 0.3,
                            child: InkWell(
                              onTap: () {
                                Get.to(
                                    FlashSeen(
                                        name: data[index]["Name"],
                                        content: data[index]["Content"]),
                                    transition: Transition.fade,
                                    duration:
                                        const Duration(milliseconds: 600));
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => FlashSeen(name: data[index]["Name"], content: data[index]["Content"],)));
                              },
                              onLongPress: () =>
                                  context.read<FlashClass>().deleteflash(index),
                              child: Card(
                                  shadowColor: Colors.amber,
                                  elevation: 6,
                                  color: Colors.amber[200],
                                  child: Gcont(
                                      Content: data[index]["Content"],
                                      Name: data[index]["Name"])),
                            ),
                          ),
                        );
                      }),
                ),
                // ElevatedButton(onPressed: ()=> getapi(), child: Icon(Icons.cabin))
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        
          Get.to(FlashUi(),
              transition: Transition.fade,
              duration: const Duration(milliseconds: 600));
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => FlashUi()));
        },
        child: Icon(Icons.add_circle_outline_sharp),
      ),
    );
  }
}
