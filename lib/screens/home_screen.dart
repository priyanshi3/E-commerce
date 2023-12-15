
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? user;

  @override
  void initState() {
    super.initState();
    if (FirebaseAuth.instance.currentUser != null) {
      user = FirebaseAuth.instance.currentUser!.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello ', style: TextStyle(fontSize: 30),),
              Text(user!, style: TextStyle(fontSize: 30),),
              ElevatedButton(
                  onPressed: () => FirebaseAuth.instance.signOut(),
                  child: Text('Sign Out')
              )
            ],
          )
      ),
    );
  }
}