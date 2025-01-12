import 'package:flashcards/GlobalWidgets/gappbar.dart';
import 'package:flashcards/GlobalWidgets/login_widgets.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController profession = TextEditingController();

 Register({super.key});

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
              text: 'Name', controller: name,
            ),
            SizedBox(
              height: 20,
            ),
            register_field(
              text: 'Email', controller: email,
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
              text: 'Profession', controller: profession,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
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
                ))
          ],
        ),
      ),
    );
  }
}
