import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:whatsappinternproject/views/Pages/Calls.dart';
import 'package:whatsappinternproject/views/Pages/Chats.dart';
import 'package:whatsappinternproject/views/Pages/Story.dart';

class ScrollPages extends StatefulWidget {
  @override
  _ScrollPagesState createState() => _ScrollPagesState();
}

class _ScrollPagesState extends State<ScrollPages> {

  BoxDecoration activePageDecoration = BoxDecoration(color: Color(0xff075E54), border: Border(bottom: BorderSide(color: Colors.green,width: 5)),);

  BoxDecoration inActivePageDecoration = BoxDecoration(color: Color(0xff075E54));

  int _CurrentPage = 0;

  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed:(){},
          backgroundColor: Color(0xff075E54),
          child: FloatingButtonIcon(_CurrentPage),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top : 10),
            width: MediaQuery.of(context).size.width,
            color: Color(0xff075E54),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HeaderTile('Chats', 0),
                HeaderTile('Story', 1),
                HeaderTile('Calls', 2),
              ],
            ),
          ),
          Expanded(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (value){
                    setState(() {
                      _CurrentPage = value;
                      _pageController.animateToPage(value, duration:Duration(milliseconds: 2), curve: Curves.easeIn);
                    });
                  },
                  children: [
                    ChatPage(),
                    StoryPage(),
                    CallPage(),
                  ],
                ),
              ),
          ),
        ],
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
