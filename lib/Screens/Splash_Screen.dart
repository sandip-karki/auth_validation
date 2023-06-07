import 'dart:async';
import 'package:student/Screens/New_User_screen.dart';

// import 'splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Newuser())));
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image(
                  image: NetworkImage(
                      'https://cdn.vectorstock.com/i/preview-1x/82/25/student-reading-a-book-vector-45388225.jpg')),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Student Arc ',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
