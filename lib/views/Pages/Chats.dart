import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
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
          color: Colors.white,
          //image: DecorationImage(image: AssetImage('assets/images/background1.png'),fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(10, (index) =>ChatBox('Ishwam', 'Message', '5:00 am',null)),
          ),
        ),
      ),
    );
  }

  Widget ChatBox(String Name,String Message,String time,String url){
      return Container(
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


}
