import 'package:flutter/material.dart';
import 'package:whatsappinternproject/views/Pages/Assets/Page%20Assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shimmer/shimmer.dart';
class StoryPage extends StatefulWidget {
  final User user;

  const StoryPage({Key key, this.user}) : super(key: key);
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent
        ),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Assets().UserStoryBox(widget.user.displayName, 'tap to update status', widget.user.photoURL, context),
              InkWell(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.only(left: 10,top: 10,bottom: 10),
                  width: double.infinity,
                  color: Color(0xfff2f2f2),
                  child: Text('Recent Updates',style: TextStyle(color: Color(0xff717577)),),
                ),
              ),
              Column(
                children: List.generate(10, (index) => Assets().ShimmerBox()),
              ),
              /*
              Column(
                children: List.generate(10, (index) => Assets().ContactStoryBox('Charlie', 'Today', null, context)),
              ),
               */
            ],
          ),
        ),
      ),
    );
  }




}
