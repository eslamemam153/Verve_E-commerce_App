import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      drawer: Drawer(),
      backgroundColor: Colors.tealAccent,
      body:Center(
        child: Text("This is Splash Screen",
        style: TextStyle(color: Colors.white,fontSize: 30),
        ),
      ),
    );
  }
}