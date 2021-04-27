import 'dart:async';
import 'dart:io';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsappinternproject/actions/RootUserLoggedIn.dart';
import 'package:whatsappinternproject/views/HomeScreen.dart';
import 'package:whatsappinternproject/views/SignIn.dart';
import 'package:google_fonts/google_fonts.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    try{
      InternetAddress.lookup('google.com').then((result){
        if(result.isNotEmpty && result[0].rawAddress.isNotEmpty)
          {
            startTimer();
          }
        else
          {
                ShowDialog();
          }
      }).catchError((Error){

      });
    }on SocketException catch (_){
      ShowDialog();
    }
  }

  void ShowDialog(){
    showDialog(context: context,
    builder: (context){
      return AlertDialog(
        title: Text('No internet Connection'),
        content: Text('Make sure you have active internet connection'),
        actions: <Widget>[
          FlatButton(onPressed: (){
            SystemChannels.platform.invokeMethod('Systemnavigator.pop');
          }, child: Text('Exit',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
        ],
      );
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
          child: Center(
            child: ColorizeAnimatedTextKit(
              repeatForever: true,
              text: [
                'guftagoo',
              ],
              speed: Duration(milliseconds: 500),
              textStyle: GoogleFonts.satisfy(
                fontSize: 54,
                fontWeight: FontWeight.bold,
              ),
              colors: [
                Color(0xffDA44bb),
                Color(0xff8921aa),
              ],
            ),
          ),
        ),
    );
  }

  void startTimer(){
    Timer(
        Duration(seconds: 3),
            (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => RootUserLoggedIn()));
        }
    );
  }

}

