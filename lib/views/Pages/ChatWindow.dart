import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsappinternproject/views/Pages/Assets/Page%20Assets.dart';

class ChatWindow extends StatefulWidget {
  @override
  _ChatWindowState createState() => _ChatWindowState();
}

class _ChatWindowState extends State<ChatWindow> {

  TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff128C7E),
        leading: GestureDetector(
            onTap: (){},
            child: CircleAvatar(
              backgroundColor: Colors.white70,
              backgroundImage: Assets().chatImage(null),
            ),),
        title: Text('Name'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/backgroundSplash.jpg'),fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(height: MediaQuery.of(context).size.height*0.9 - 100,
              width: double.infinity,
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.1,
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Color(0xff878787),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: TextField(
                        controller: messageController,
                        textAlign: TextAlign.start,
                        cursorColor: Colors.white70,
                        style: TextStyle(color: Colors.white,fontSize: 14),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(
                              color: Color(0xff878787),
                            )
                          ),
                          hintText: 'Type your text',
                          hintStyle: TextStyle(color: Colors.white30),
                          enabled: true,

                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide: BorderSide(
                                color: Color(0xff878787),
                              )
                          ),
                        ),
                        ),
                    ),
                    ),
                  SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){},
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xff075E54),
                      child: Icon(Icons.send,color: Colors.white,),
                    ),
                  ),
                ],
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}
