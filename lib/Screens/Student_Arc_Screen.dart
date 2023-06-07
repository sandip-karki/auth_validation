import 'package:flutter/material.dart';

class Student_Arc extends StatelessWidget {
  const Student_Arc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Arc '),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
          child: Center(
        child: Container(
          child: Text(
            'WELCOME BRO',
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ),
      )),
    );
  }
}
