import 'package:flutter/material.dart';

class Gappbar extends StatelessWidget implements PreferredSizeWidget {
  const Gappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'FlashCards',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic
        ),
      ),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.yellow, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
       
      ),
      elevation: 5, 
    
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
