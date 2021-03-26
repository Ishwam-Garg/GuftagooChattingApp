import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsappinternproject/views/Pages/ScrollingPages.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        SystemNavigator.pop();
        return true as Future;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff075E54),
          elevation: 0,
          leading: GestureDetector(
            onTap: (){},
            child: Icon(Icons.menu,color: Colors.white,),
          ),
          actions: [
            Icon(Icons.search,color: Colors.white,),
            SizedBox(width: 5,),
            Icon(Icons.person,color: Colors.white,)
          ],
          title: Text('Messenger'),
          titleSpacing: -10,
        ),
        body: ScrollPages(),
      ),
    );
  }
}
