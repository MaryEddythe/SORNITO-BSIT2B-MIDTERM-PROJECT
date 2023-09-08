import 'package:flutter/material.dart';
import 'dart:io';
//Submitted by: Mary Eddythe SORNITO BSIT2B
import 'package:image_picker/image_picker.dart';
import 'package:obscura/custom_icons.dart';
import 'package:tflite/tflite.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:obscura/main.dart';
import 'package:obscura/custom_icons.dart';


import 'package:flutter/material.dart';
import 'pages/dashboard.dart';
import 'pages/info.dart';
import 'pages/profile.dart';
import 'pages/setting.dart';
import 'mask.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState ()  => _HomeState();
}

class _HomeState extends State <Home>{ 

int currentTab = 0;
final List<Widget> screens = [
  Dashboard(),
  Info(),
  Mask(),
  Profile(),
];

final PageStorageBucket bucket = PageStorageBucket();
Widget currentScreen = Dashboard();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               
                MaterialButton(
                  //minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = Dashboard();
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CustomIcons.home,
                        color: currentTab == 0 ? Color(0xff29a19c) : Colors.grey,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(color: currentTab == 0 ? Color(0xff29a19c) : Colors.grey
                        ),
                      )
                    ],
                  ),
                  ),


               MaterialButton(
                  //minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = Info();
                      currentTab = 1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CustomIcons.info,
                        color: currentTab == 1 ? Color(0xff29a19c) : Colors.grey,
                      ),
                      Text(
                        'Info',
                        style: TextStyle(color: currentTab == 1 ? Color(0xff29a19c) : Colors.grey
                        ),
                      )
                    ],
                  ),
                  )
              ],
              ),

              MaterialButton(
                 // minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = Mask();
                      currentTab = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CustomIcons.mask,
                        color: currentTab == 2 ? Color(0xff29a19c) : Colors.grey,
                      ),
                      Text(
                        'Detector',
                        style: TextStyle(color: currentTab == 2 ? Color(0xff29a19c) : Colors.grey
                        ),
                      )
                    ],
                  ),
                  ),


            


               MaterialButton(
                  //minWidth: 40,
                  onPressed: (){
                    setState(() {
                      currentScreen = Profile();
                      currentTab = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CustomIcons.user,
                        color: currentTab == 3 ? Color(0xff29a19c): Colors.grey,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(color: currentTab == 3 ? Color(0xff29a19c) : Colors.grey
                        ),
                      )
                    ],
                  ),
                  )
              ],
              )
            
          ),
        ),
      );
    
   
  }
}
