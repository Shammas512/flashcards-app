import 'package:flashcards/GlobalWidgets/gappbar.dart';
import 'package:flashcards/GlobalWidgets/gcont.dart';
import 'package:flashcards/Provider/provider_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Flashcarda extends StatelessWidget {
  const Flashcarda({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: Gappbar(),
      body: Consumer<FlashClass>(
          builder: (ctx,provider,_){
            var data = provider.flashpro();
            return   Padding(
          padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
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
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: SizedBox(
                          
                          height: height*0.3,
                          child: Card(
                            
                            shadowColor: Colors.amber,
                            elevation: 6,
                            color: Colors.amber[200],
                            child:Gcont(Content: data[index]["Content"], Name: data[index]["Name"])
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        );
          },
      
      ),
    );
  }
}
