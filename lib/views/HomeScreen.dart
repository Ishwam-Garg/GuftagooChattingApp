import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsappinternproject/actions/Auth.dart';
import 'package:whatsappinternproject/views/Pages/ScrollingPages.dart';
import 'package:whatsappinternproject/views/Settings.dart';
import 'package:whatsappinternproject/views/SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({Key key, this.user}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        SystemNavigator.pop();
        return true as Future;
      },
      child: Scaffold(
        body: ScrollPages(user: widget.user,),
      ),
    );
  }
}
