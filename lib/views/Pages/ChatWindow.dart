import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsappinternproject/views/Pages/Assets/Page%20Assets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class ChatWindow extends StatefulWidget {

  final User user;
  final String name;
  final String uid;
  final String email;
  final String url;
  const ChatWindow({Key key, this.user, this.uid,this.email,this.url,this.name}) : super(key: key);

  @override
  _ChatWindowState createState() => _ChatWindowState();
}

class _ChatWindowState extends State<ChatWindow> {

  TextEditingController messageController = TextEditingController();
  String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff128C7E),
        leading: GestureDetector(
            onTap: (){},
            child: CircleAvatar(
              backgroundColor: Colors.white70,
              backgroundImage: Assets().chatImage(widget.url),
            ),),
        title: Text(widget.name.toString()),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/backgroundSplash.jpg'),fit: BoxFit.fill),
        ),
        child: Stack(
              children: [
                Positioned(
                    top: 0,
                    child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent,
                    height: MediaQuery.of(context).size.height*0.9-100,
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance.collection('Users').doc(widget.user.email).collection('Chats').doc(widget.uid)
                            .collection('Messages').orderBy('createdAt',descending: false).snapshots(),
                        builder: (context,snapshot){
                          if(snapshot.connectionState == ConnectionState.waiting)
                            {
                              return CircularProgressIndicator();
                            }
                          else if(snapshot.hasData)
                          {
                            return Container(
                              height: MediaQuery.of(context).size.height*0.9-80,
                              child: ListView.builder(
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (context,index){
                                  print(snapshot.data.docs.length);
                                  DocumentSnapshot data =snapshot.data.docs[index];
                                  return Align(
                                    alignment: data.data()['createdBy'] == widget.user.uid ? Alignment.centerRight : Alignment.centerLeft,
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                      decoration: BoxDecoration(
                                        color: Color(0xff075E54),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      width: MediaQuery.of(context).size.width*0.4,
                                      child: Column(
                                        children: [
                                          Text(data.data()["message"],textAlign: TextAlign.start,style: TextStyle(color: Colors.white,fontSize: 14),),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                )),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
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
                              onChanged: (value){
                                setState(() {
                                  message = value;
                                });
                              },
                              onSubmitted: (value){
                                setState(() {
                                  message = value;
                                });
                              },
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
                          onTap: (){
                            if(message.isNotEmpty)
                            {
                              FirebaseFirestore.instance.collection('Users').doc(widget.user.email).collection('Chats')
                                  .doc(widget.uid).collection('Messages').add({
                                'message': message,
                                'createdAt': Timestamp.now(),
                                'createdBy': widget.user.uid,
                              });

                              FirebaseFirestore.instance.collection('Users').doc(widget.email).collection('Chats').doc(widget.user.uid).collection('Messages').add({
                                'message': message.toString(),
                                'createdAt': Timestamp.now(),
                                'createdBy': widget.user.uid,
                              });
                              messageController.clear();
                            }
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Color(0xff075E54),
                            child: Icon(Icons.send,color: Colors.white,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

      ),
    );
  }




}

