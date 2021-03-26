import 'package:flutter/material.dart';
import 'package:whatsappinternproject/views/Pages/Assets/Page%20Assets.dart';

class CallPage extends StatefulWidget {
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: List.generate(10, (index) => Assets().UserCallBox('Jai Rana', 'Today, 9:07', null, context)),
          ),
        ),
      ),
    );
  }
}
