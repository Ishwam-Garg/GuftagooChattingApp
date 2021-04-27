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


  ScrollController _controller = ScrollController();

  TextEditingController messageController = TextEditingController();
  String message;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color(0xff703d57),
        leading: GestureDetector(
            onTap: (){
                showDialog(context: context, builder: (BuildContext context){
                  return AlertDialog(
                    backgroundColor: Color(0xff703d57),
                    contentPadding: EdgeInsets.all(0),
                    title: Image(image: NetworkImage(widget.url),fit: BoxFit.fill,height: 200,),
                    titlePadding: EdgeInsets.all(0),
                    actionsPadding: EdgeInsets.all(0),
                    content: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.chat,color: Colors.white,size: 28,),
                          Icon(Icons.call,color: Colors.white,size: 28,),
                          Icon(Icons.videocam,color: Colors.white,size: 28,),
                          Icon(Icons.info_outline,color: Colors.white,size: 28,),
                        ],
                      ),
                    ),
                  );
                });
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: CircleAvatar(
                backgroundColor: Colors.white70,
                backgroundImage: Assets().chatImage(widget.url),
              ),
            ),),
        title: Text(widget.name.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
        centerTitle: true,
        actions: [
          InkWell(
            customBorder: CircleBorder(),
            splashColor: Color(0xffd9b8c4),
            onTap: (){},
            child: Container(
                padding: EdgeInsets.all(5),
                child: Icon(Icons.more_vert,color: Colors.white,)),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffD9B8C4),
              Color(0xff957186),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          //image: DecorationImage(image: AssetImage('assets/images/backgroundSplash.jpg'),fit: BoxFit.fill),
        ),
        child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 80),
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
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                    if(_controller.hasClients)
                                      _controller.animateTo(_controller.position.maxScrollExtent,
                                          duration: Duration(milliseconds: 500),
                                          curve: Curves.fastOutSlowIn);
                                });
                                return ListView.builder(
                                    physics: ScrollPhysics(),
                                    controller: _controller,
                                    scrollDirection: Axis.vertical,
                                    reverse: false,
                                    itemCount: snapshot.data.docs.length,
                                    itemBuilder: (context,index){
                                      print(snapshot.data.docs.length);
                                      DocumentSnapshot data =snapshot.data.docs[index];
                                      return Align(
                                        alignment: data.data()['createdBy'] == widget.user.uid ? Alignment.centerRight : Alignment.centerLeft,
                                        child: Container(
                                          margin: EdgeInsets.only(left: 10,top: 10,right: 10),
                                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                          decoration: BoxDecoration(
                                            color: Color(0xff957186),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          width: MediaQuery.of(context).size.width*0.4,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(data.data()["message"],textAlign: TextAlign.start,
                                                style: TextStyle(color: Colors.white,fontSize: 14),),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                              }
                              return Container();
                            },
                          ),
                ),
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
                              color: Color(0xffD9B8C4),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: TextField(

                              onChanged: (value){
                                message = value;
                              },
                              onSubmitted: (value){
                                message = value;
                              },
                              controller: messageController,
                              textAlign: TextAlign.start,
                              cursorColor: Colors.white70,
                              style: TextStyle(color: Colors.white,fontSize: 14),
                              decoration: InputDecoration(
                                hintText: 'Type your text',
                                hintStyle: TextStyle(color: Colors.white30,),
                                enabled: true,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                //prefixIcon: Icon(Icons.face_outlined,color: Color(0xff703557),),
                                contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
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
                              setState(() {
                                message = null;
                              });
                            }
                          },
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: Color(0xff703d57),
                            child: Icon(Icons.send,color: Colors.white,size: 16,),
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

