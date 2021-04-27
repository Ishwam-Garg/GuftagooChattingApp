import 'package:flutter/material.dart';
import 'package:whatsappinternproject/views/Pages/ChatWindow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shimmer/shimmer.dart';
class Assets{

  Widget ShimmerBox(){
    return Shimmer.fromColors(
      enabled: true,
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[100],
      child: Container(
        margin: EdgeInsets.only(left: 20,right: 20,top: 10),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 8.0,
                      color: Colors.white,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Container(
                      width: double.infinity,
                      height: 8.0,
                      color: Colors.white,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Container(
                      width: 40.0,
                      height: 8.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget ChatBox(String Name,String url,String uid,String email,BuildContext context,User user){
    return InkWell(
      splashColor: Color(0xffD9B8C4),
      highlightColor: Color(0xff957186),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatWindow(user: user,uid: uid,email: email,url: url,name: Name,)));},
      child: Container(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right:MediaQuery.of(context).size.width*0.05 ,top: MediaQuery.of(context).size.width*0.01),
        width: MediaQuery.of(context).size.width,
        //height: MediaQuery.of(context).size.width*0.22,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: MediaQuery.of(context).size.width*0.075+0.5,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width*0.075,
                backgroundImage: chatImage(url),
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0XFFB5B7BB),
                        width: 1,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '$Name',
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                            ),
                          ),
                          /*
                          Align(
                              alignment: Alignment.topRight,
                              child: Text('$time',style: TextStyle(color: Color(0xff25D366),fontWeight: FontWeight.w400),)),
                        */
                        ],
                      ),
                      /*
                      SizedBox(height: 5,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('$Message',
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.clip,maxLines: 1,style: TextStyle(color: Colors.black54,fontSize: 14),),
                      ),
                      */
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  ImageProvider chatImage(String url){
    if(url!=null)
    {
      return NetworkImage(url);
    }
    else
    {
      return AssetImage("assets/images/profile.png");
    }
  }

  Widget UserStoryBox(String Name,String Message,String url,BuildContext context){
    return  InkWell(
      onTap: (){},
      splashColor: Colors.black26,
      child: Ink(
        child: Container(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right:MediaQuery.of(context).size.width*0.05 ,top: MediaQuery.of(context).size.width*0.01),
          width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.width*0.22,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width*0.075+0.5,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width*0.075,
                  backgroundImage: chatImage(url),
                  backgroundColor: Colors.white,
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 11,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Color(0xffd9b8c4),
                          child: Center(child: Icon(Icons.add,color: Colors.white,size: 16,)),
                        ),
                      )),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0XFFB5B7BB),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '$Name',
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('$Message',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,maxLines: 1,style: TextStyle(color: Colors.black54,fontSize: 14),),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget ContactStoryBox(String Name,String Message,String url,BuildContext context)
  {
    return  InkWell(
      onTap: (){},
      splashColor: Colors.black26,
      child: Ink(
        child: Container(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right:MediaQuery.of(context).size.width*0.05 ,top: MediaQuery.of(context).size.width*0.01),
          width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.width*0.22,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width*0.075+0.5,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width*0.075,
                  backgroundImage: chatImage(url),
                  backgroundColor: Colors.white,
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0XFFB5B7BB),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '$Name',
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text('$Message',
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.clip,maxLines: 1,style: TextStyle(color: Colors.black54,fontSize: 14),),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget UserCallBox(String Name,String Message,String url,BuildContext context){
    return  InkWell(
      onTap: (){},
      splashColor: Color(0xffD9B8C4),
      highlightColor: Color(0xff957186),
      child: Ink(
        child: Container(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right:MediaQuery.of(context).size.width*0.05 ,top: MediaQuery.of(context).size.width*0.01),
          width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.width*0.22,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: MediaQuery.of(context).size.width*0.075+0.5,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width*0.075,
                  backgroundImage: chatImage(url),
                  backgroundColor: Colors.white,
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0XFFB5B7BB),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    '$Name',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('$Message',
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.clip,maxLines: 1,style: TextStyle(color: Colors.black54,fontSize: 14),),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: Icon(Icons.phone,size: 24,color: Color(0xff703d57),),
                        ),
                      ],
                    ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}