import 'package:flutter/material.dart';
import 'package:whatsappinternproject/views/Pages/ChatWindow.dart';

class Assets{
  Widget ChatBox(String Name,String Message,String time,String url,BuildContext context){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatWindow()));},
      splashColor: Colors.black26,
      child: Container(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,right:MediaQuery.of(context).size.width*0.05 ,top: MediaQuery.of(context).size.width*0.01),
        width: MediaQuery.of(context).size.width,
        //height: MediaQuery.of(context).size.width*0.22,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
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
                          Align(
                              alignment: Alignment.topRight,
                              child: Text('$time',style: TextStyle(color: Color(0xff25D366),fontWeight: FontWeight.w400),)),
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
                        radius: 10,
                        backgroundColor: Color(0xff25D366),
                        child: Center(child: Icon(Icons.add,color: Colors.white,size: 16,)),
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

  Widget UserCallBox(String Name,String Message,String url,BuildContext context){
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
                        radius: 10,
                        backgroundColor: Color(0xff25D366),
                        child: Center(child: Icon(Icons.add,color: Colors.white,size: 16,)),
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
                          child: Icon(Icons.phone,size: 24,color: Color(0xff075E54),),
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