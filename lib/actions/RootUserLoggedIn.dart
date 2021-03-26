import 'package:flutter/material.dart';
import 'package:whatsappinternproject/views/HomeScreen.dart';
import 'package:whatsappinternproject/views/SignIn.dart';
import 'dart:async';
import 'Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RootUserLoggedIn extends StatelessWidget {

  User user;
  @override
  Widget build(BuildContext context) {
    //User is depreciated form of FirebaseUser
    return FutureBuilder<User>(
        future: getCurrentUser(),//FirebaseAuth.instance.currentUser() => FirebaseAuth.instance.currentUser
        builder: (BuildContext context, AsyncSnapshot<User> snapshot)
        {
          if(snapshot.hasData)
          {
            User user = snapshot.data;
            print(snapshot.data);
            return HomeScreen(user: user,);
          }

          return SignIn();

        }
    );
  }
}
