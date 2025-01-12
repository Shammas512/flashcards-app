import 'dart:convert';

import 'package:flashcards/Flashcard_Screen/flashcarda.dart';
import 'package:flashcards/GlobalWidgets/gappbar.dart';
import 'package:flashcards/GlobalWidgets/login_widgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String id = "";
  
  // Post API function
  void postapi(String namee, emaile, usernamee, proffesione) async {
    try {
      Response response = await post(
          Uri.parse(
              "https://crudcrud.com/api/cedfb5625fa0450d8e20487f24dc5db6/unicorns"),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "name": namee,
            "email": emaile,
            "username": usernamee,
            "profession": proffesione,
          }));
      
      if (response.statusCode == 201) {
        var data = jsonDecode(response.body);
        print("POSt ID : ${data["_id"]}");
        setState(() {
          id = data["_id"];
        });
        print("Ok");

        // Move to next page after id is set
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Flashcarda(
                      id: id, // Now passing the id here
                    )));
      } else {
        print("Error");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Text controllers
  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController profession = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Gappbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Registeration",
              style: TextStyle(
                  fontSize: 28,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Please introduce yourself to continue... ",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            register_field(
              text: 'Name',
              controller: name,
            ),
            SizedBox(
              height: 20,
            ),
            register_field(
              text: 'Email',
              controller: email,
            ),
            SizedBox(
              height: 20,
            ),
            register_field(
              controller: username,
              text: 'UserName',
            ),
            SizedBox(
              height: 20,
            ),
            register_field(
              text: 'Profession',
              controller: profession,
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                postapi(name.text, email.text, username.text, profession.text);
              },
              child: Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Color(0xff0000FF),
                  ),
                  child: Center(
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
