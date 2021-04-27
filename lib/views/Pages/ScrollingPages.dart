import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:whatsappinternproject/views/Pages/Calls.dart';
import 'package:whatsappinternproject/views/Pages/Chats.dart';
import 'package:whatsappinternproject/views/Pages/Story.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatsappinternproject/views/Settings.dart';
class ScrollPages extends StatefulWidget {
  final User user;

  const ScrollPages({Key key, this.user}) : super(key: key);
  @override
  _ScrollPagesState createState() => _ScrollPagesState();
}

class _ScrollPagesState extends State<ScrollPages> {

  BoxDecoration activePageDecoration = BoxDecoration(color: Color(0xff703d57), border: Border(bottom: BorderSide(color: Color(0xffd9b8c4),width: 5)),);

  BoxDecoration inActivePageDecoration = BoxDecoration(color: Color(0xff703d57));

  int _CurrentPage = 0;

  PageController _pageController = PageController(initialPage: 0);

  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            leading: Container(),
            title: Text('Guftagoo',style: TextStyle(color: Colors.white),),
            titleSpacing: -30,
            actions: [
              InkWell(
                onTap: (){
                  Navigator.push(context, CupertinoPageRoute(builder: (context)=>Settings(user: widget.user,)));
                },
                customBorder: CircleBorder(),
                child: Icon(Icons.more_vert,color: Colors.white,),
              ),
            ],
            backgroundColor: Color(0xff703d57),
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width,30),
              child: TabBar(
                isScrollable: false,
                indicatorWeight: 3,
                indicatorColor: Color(0xffd9b8c4),
                physics: ScrollPhysics(),
                tabs: <Widget>[
                  Tab(text: 'Chats',),
                  Tab(text: 'Story',),
                  Tab(text: 'Calls',),
                ],
              ),
            ),
          ),
        body: TabBarView(
          physics: ScrollPhysics(),
            children: <Widget>[
              ChatPage(user: widget.user,),
              StoryPage(user: widget.user,),
              CallPage(),
            ],
        ),
      ),
    );
  }

  Widget HeaderTile(String text,int index)
  {
    return GestureDetector(
      onTap: (){
        setState(() {
          _CurrentPage = index;
          _pageController.animateToPage(index, duration: Duration(milliseconds: 2), curve: Curves.easeIn);
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.33,
        decoration: _CurrentPage == index ? activePageDecoration : inActivePageDecoration,
        child: AutoSizeText(text,
          textAlign: TextAlign.center,
          style: TextStyle(color: _CurrentPage == index ? Colors.white:Colors.white70,fontWeight: FontWeight.w600,fontSize: 14),),
      ),
    );
  }

  Widget FloatingButtonIcon(int index){
    switch(index){
      case 0:{
        return Icon(Icons.message,color: Colors.white,);
      }
      case 1:{
        return Icon(Icons.photo_camera,color: Colors.white,);
      }
      case 2:{
        return Icon(Icons.phone,color: Colors.white,);
      }
    }
  }

}
