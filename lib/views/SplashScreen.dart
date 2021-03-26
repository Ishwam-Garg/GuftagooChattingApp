import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whatsappinternproject/actions/RootUserLoggedIn.dart';
import 'package:whatsappinternproject/views/HomeScreen.dart';
import 'package:whatsappinternproject/views/SignIn.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              Center(
                  child: Image.asset("assets/images/message.gif")
              ),
              Text('Just Send It',style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w600,fontSize: 22),),
            SizedBox(height: 30,),
            ],
          )
    );
  }

  void startTimer(){
    Timer(
        Duration(seconds: 2),
            (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => RootUserLoggedIn()));
        }
    );
  }

}

