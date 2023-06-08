import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student/Screens/Login._Screen.dart';

import '../domain/helpers/auth_helper.dart';
import '../provider/auth_provider.dart';

class Newuser extends StatelessWidget {
  Newuser({super.key});
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
            child: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    Text(
                      'Register with ',
                      style: TextStyle(
                        // color: Colors.blue,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'Student Arc',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 62,
                    width: 350,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 224, 221, 221)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                          controller: emailCtrl,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                  color: Colors.black, fontSize: 20))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 62,
                    width: 350,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 224, 221, 221)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        controller: nameCtrl,
                        decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: 'Full name',
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 62,
                    width: 350,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 224, 221, 221)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        controller: passCtrl,
                        decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: 'Password',
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 62,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(20, 27, 65, 1),
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20)),
                  child: InkWell(
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onTap: () async {
                        String email = emailCtrl.text.trim();
                        String pass = passCtrl.text.trim();
                        String name = nameCtrl.text.trim();
                        if (Registerhelper.checkUserInputs(
                            email: email, password: pass, name: name)) {
                          final res = await context
                              .read<AuthProvider>()
                              .register(
                                  email: email, password: pass, name: name);
                          if (res == 'ok') {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(res.toString())));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Email or Password is empty')));
                        }
                      }),
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Already a user?',
                        style: TextStyle(fontSize: 20),
                      ),
                      TextButton(
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                      )
                    ],
                  ),
                )
              ]),
        )),
      ),
    );
  }
}
