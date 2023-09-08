import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:obscura/pages/edit_profile_page.dart';
import 'package:obscura/pages/numbers_widget.dart';
import 'package:obscura/pages/profile_widget.dart';
import 'package:obscura/pages/user.dart';
import 'package:obscura/pages/user_preference.dart';

class Profile extends StatefulWidget{
  @override
  _ProfileState createState ()  => _ProfileState();
}

class _ProfileState extends State <Profile>{
  @override
  Widget build(BuildContext context){
     final user = UserPreferences.getUser();


    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
                onClicked: () async {
                   await Navigator.of(context).push(
                     MaterialPageRoute(builder: (context) => EditProfilePage()),
                   );
                     setState(() {});
                },
          ),
          const SizedBox(height: 16),
          buildName(user),
          const SizedBox(height: 30),
          NumbersWidget(),
          const SizedBox(height: 48),
           buildAbout(user),
        ],
      ),
    );
  }

    Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 23
                            ),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
           style: GoogleFonts.poppins(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 15
             ),
          ),
        ]
          );
 

      Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bio',
              style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 23
             ),
           ),
           
             
            const SizedBox(height: 16),
            Text(
              user.about,
              //style: TextStyle(fontSize: 16, height: 1.4),
              style: GoogleFonts.poppins(
            fontWeight: FontWeight.w300,
            height: 1.4,
            fontSize:16,
                            ),
           ),
          ]
            )
          
        );
          
           
           
       
  
      
 }
  
  buildAppBar(BuildContext context) {
    return AppBar(
      leading: BackButton(),
      backgroundColor: Colors.transparent,
      //backgroundColor: Color(0XFF008080),
      elevation: 0,
      
    );
  }

