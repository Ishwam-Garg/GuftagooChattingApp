import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsappinternproject/actions/Auth.dart';
import 'package:whatsappinternproject/views/Pages/Assets/Page%20Assets.dart';
import 'package:whatsappinternproject/views/SignIn.dart';
class Settings extends StatefulWidget {
  final User user;

  const Settings({Key key, this.user}) : super(key: key);
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff128C7E),
        title: Text('Settings',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1),
                padding: EdgeInsets.only(top:30,bottom: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 0.5,
                      color: Color(0XFFB5B7BB),
                    ),
                  ),
                ),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width*0.1+0.5,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: MediaQuery.of(context).size.width*0.1,
                        backgroundImage: Assets().chatImage(widget.user.photoURL),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.user.displayName,style: TextStyle(color: Colors.black87,fontSize: 16),),
                        FlatButton(
                          onPressed: (){
                            signOutUser().whenComplete((){
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SignIn()), (route) => false);
                            });
                          },
                          child: Text('Log out',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          color: Color(0xff25D366),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
