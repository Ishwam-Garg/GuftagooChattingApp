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
        appBar: AppBar(
          backgroundColor: Color(0xff128C7E),
          elevation: 0,
          leading: Container(),
          actions: [
            Icon(Icons.search,color: Colors.white,),
            SizedBox(width: 5,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings(user: widget.user,)));
              },
              child: Icon(Icons.more_vert,color: Colors.white,),
            ),
          ],
          title: Text('Messenger'),
          titleSpacing: -30,
        ),
        body: ScrollPages(user: widget.user,),
      ),
    );
  }
}
