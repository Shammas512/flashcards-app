import 'package:flashcards/Flashcard_Screen/flash_seen.dart';
import 'package:flashcards/Flashcard_Screen/flash_ui.dart';
import 'package:flashcards/GlobalWidgets/gappbar.dart';
import 'package:flashcards/GlobalWidgets/gcont.dart';
import 'package:flashcards/Provider/provider_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class Flashcarda extends StatelessWidget {
  const Flashcarda({super.key});

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
                    "Anonymous",
                    style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  ),
                  subtitle: Text(
                    "Anonymous@gmail.com",
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
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(FlashUi() , transition: Transition.fade,duration:const  Duration(milliseconds: 600 ));
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => FlashUi()));
        },
        child: Icon(Icons.add_circle_outline_sharp),
      ),
    );
  }
}
