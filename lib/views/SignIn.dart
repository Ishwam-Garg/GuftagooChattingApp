import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsappinternproject/actions/Auth.dart';
import 'package:whatsappinternproject/views/HomeScreen.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
             image: DecorationImage(image: AssetImage('assets/images/background1.png'),fit: BoxFit.fill),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: MediaQuery.of(context).size.width*0.2,
                  backgroundImage: AssetImage('assets/images/chat.png'),
                ),
              ),
              /*
              Text('Please Sign In to Start Chatting !',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,fontWeight: FontWeight.w600),overflow: TextOverflow.clip,
              ),
               */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      //CreateUserInFireStore('GoogleMail');
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                      /*
                      google_sign_in().then((user){
                        if(user!=null)
                          {
                            CreateUserInFireStore('GoogleMail');
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                          }

                      });
                       */

                      
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 10,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Google Sign in',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xff69cc00)),),
                            SizedBox(width: 5,),
                            CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 20,
                              child: Image.asset('assets/images/google.png'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }


  CreateUserInFireStore(String LoginMode) async{
    //User user = await auth.currentUser;
    DocumentReference ref = FirebaseFirestore.instance.collection("Users").doc('hello');

    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";

    //List<String> splitList = user.displayName.split(' ');
    //List<String> indexList = [];

    /*
    for(int i=0;i<splitList.length;i++)
    {
      for(int j=0;j<splitList[i].length + i;j++)
      {
        indexList.add(splitList[i].substring(0,j).toLowerCase());
      }
    }
     */


    Map<String,String> UserData ={
      "Name": 'user.displayName',
      "uid": 'user.uid',
      "Photo_url": 'user.photoURL',
      "email": 'user.email',
      "phone": 'user.phoneNumber',
      "login_Date": formattedDate.toString(),
      "login_mode": LoginMode,
    };

    /*
    Map<String,List<String>> searchIndexData = {
      'searchIndex': ,
    };
     */

    ref.collection("UserData").doc("information").set(UserData);
    //ref.set(searchIndexData);
  }

}


