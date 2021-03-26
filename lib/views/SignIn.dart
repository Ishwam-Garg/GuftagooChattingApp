import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsappinternproject/actions/Auth.dart';
import 'package:whatsappinternproject/views/HomeScreen.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
             image: DecorationImage(image: AssetImage('assets/images/background1.png'),fit: BoxFit.fill),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: MediaQuery.of(context).size.width*0.2,
                  backgroundImage: AssetImage('assets/images/chat.png'),
                ),
              ),
              /*
              Text('Please Sign In to Start Chatting !',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,fontWeight: FontWeight.w600),overflow: TextOverflow.clip,
              ),
               */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 10,
                      color: Color(0xff69cc00),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Google Sign in',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                            SizedBox(width: 5,),
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 20,
                              child: Image.asset('assets/images/google.png'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }
}


