import 'package:flutter/material.dart';
import 'package:whatsappinternproject/views/Pages/Assets/Page%20Assets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatPage extends StatefulWidget {
  final User user;

  const ChatPage({Key key, this.user}) : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          //image: DecorationImage(image: AssetImage('assets/images/background1.png'),fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection('Users').where("uid",isNotEqualTo: widget.user.uid).snapshots(),
              builder: (context,snapshot){
                    if(snapshot.hasData)
                      {
                        return Container(
                          height: MediaQuery.of(context).size.height*0.8,
                          child: ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (context,index){
                                DocumentSnapshot data =snapshot.data.docs[index];
                                return Assets().ChatBox(
                                    data.data()["Name"],
                                    data.data()["Photo_url"],
                                    data.data()['uid'],
                                    data.data()['email'],
                                    context,
                                    widget.user,
                                );
                              }),
                        );
                      }
                    return Container();
              }),
        ),
      ),
    );
  }

/*
Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(10, (index) =>Assets().ChatBox('Ishwam', 'what is up', '10::00 pm', null, context)),
          ),
 */


}
