import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    try{
      InternetAddress.lookup('google.com').then((result){
        if(result.isNotEmpty && result[0].rawAddress.isNotEmpty)
          {
            startTimer();
          }
        else
          {

          }
      }).catchError((Error){

      });
    }on SocketException catch (_){
      ShowDialog();
    }
  }

  void ShowDialog(){
    showDialog(context: context,
    builder: (context)=>AlertDialog(
      title: Text('No internet Connection'),
      content: Text('Make sure you have active internet connection'),
      actions: <Widget>[
        FlatButton(onPressed: (){
          SystemChannels.platform.invokeMethod('Systemnavigator.pop');
        }, child: Text('Exit',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
      ],
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/backgroundSplash.jpg'),fit: BoxFit.fill),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                Center(
                    child: Image.asset("assets/images/icon.png",width: MediaQuery.of(context).size.width*0.4,)
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Just Send your message in an instant to anyone',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
                ),
              SizedBox(height: 30,),
              ],
            ),
        )
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

