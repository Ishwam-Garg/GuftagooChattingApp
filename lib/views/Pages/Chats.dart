import 'package:flutter/material.dart';
import 'package:whatsappinternproject/views/Pages/Assets/Page%20Assets.dart';

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
          color: Colors.transparent,
          //image: DecorationImage(image: AssetImage('assets/images/background1.png'),fit: BoxFit.fill),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(10, (index) =>Assets().ChatBox('Ishwam', 'what is up', '10::00 pm', null, context)),
          ),
        ),
      ),
    );
  }




}
