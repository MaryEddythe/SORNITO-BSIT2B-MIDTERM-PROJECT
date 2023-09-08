import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:obscura/pages/dashboard.dart';

import 'constant.dart';

class Info extends StatefulWidget{
  @override
  _InfoState createState ()  => _InfoState();
}

class _InfoState extends State <Info>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
         children: <Widget>[
            ClipPath(
              clipper: MyClippers(),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                Color.fromARGB(255, 0, 100, 100),
                Color(0xff34B6B6),
                ],
              ),
                image: DecorationImage(
                image: AssetImage('assets/images/virus.png'),
                ),
              ),
      
              child: Stack(
                  children: <Widget> [
                    // SvgPicture.asset(
                    //   "assets/images/info.svg", 
                    //   width: 200,
                    //   height: 200,
                    //   fit: BoxFit.fitWidth,
                    //   alignment: AlignmentDirectional.center,
                    //   ),
                      Positioned(
                        top: 60,
                        left: 65,
                        child: Text('Know more about COVID-19',
                         style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20
                          ),
                        )
                        ),
                  ],
                ),
              ), 
         ),
         SizedBox(height: 1),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Possible symptoms",
                                 style: GoogleFonts.poppins(          
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF303030),
                                fontSize: 20,
                                 ),
                              ),
                            ],
                          ),
                        ),
                        
                    
         ]
                    ),
                    SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget> [
                            SymptomCard(
                              image: "assets/images/fever.png", 
                              title: "Fever",
                              isActive: true,
                              ),
                               SymptomCard(
                              image: "assets/images/cough.png", 
                              title: "Cough",
                              ),
                               SymptomCard(
                              image: "assets/images/nausea.png", 
                              title: "Nausea",
                              ),
                          ],
                        ),
      
                        SizedBox(height: 20),
                        Text("How to Protect Yourself and Others", 
                        style: kTitleTextstyle),
                      SizedBox(height: 5),

                      PreventCard(
                        text: "COVID 19-vaccines are effective at protecting people from getting seriously ill, being hospitalized, and dying.",
                        image: "assets/images/vaccine.png",
                        title: "Get Vaccinated"
                        ),

                      PreventCard(
                        text: "Masks should be used as part of a comprehensive strategy of measures to suppress transmission and save lives; the use of a mask alone is not sufficient to provide an adequate level of protection against COVID-19.",
                        image: "assets/images/1.png",
                        title: "Wash masks correctly"
                        ),
      
                      PreventCard(
                        text: "Handwashing has always been one of most effective ways of keeping diseases at bay. It is a simple act that pays in dividends when it comes to keeping ourselves healthy and safe.",
                        image: "assets/images/2.png",
                        title: "Wash your hands"
                        ),

                        PreventCard(
                        text: "With COVID-19, the goal of social distancing right now is to slow down the outbreak in order to reduce the chance of infection among high-risk populations and to reduce the burden on health care systems and workers.",
                        image: "assets/images/social.png",
                        title: "Social Distancing"
                        ),

                         PreventCard(
                        text: "“The means of transmission can be through respiratory droplets produced when a person coughs or sneezes, says Dr. David Goldberg.",
                        image: "assets/images/cover.png",
                        title: "Cover your mouth and nose"
                        ),
                        SizedBox(height: 50),
                  ],
                  
        ),
              ),
         ],
        ),
      )
          );

  }
}

class PreventCard extends StatelessWidget {
  final String image;
  final String title;
  final String text;
  const PreventCard({
    super.key, 
    required this.image, 
    required this.title, 
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170, 
    child: Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[Container(height: 160, width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
        BoxShadow(
       offset: Offset(0, 8),
       blurRadius: 24,
       color: kShadowColor,
          ),
         ],
        ),
       ),
       Image.asset(image,
       height: 140,
       ),
       Positioned(
        left: 140,
        child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20, vertical: 15,
          ),
        height: 135,
        width: MediaQuery.of(context).size.width - 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title, 
            style: GoogleFonts.poppins(          
              fontWeight: FontWeight.bold,
              color: Color(0xFF303030),
              fontSize: 15,
               ),
          ),
          Text(text,
          style: GoogleFonts.poppins(          
              color: Color(0xFF959595),
              fontSize: 10,
               ),
          ),
       
          ],
        ),
       ),
      ),
      ],
     )
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String image;
  final String title;
  final bool isActive;
  const SymptomCard({
    Key? key, 
    required this.image, 
    required this.title,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive 
          ? BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: kActiveShadowColor,
          )
          : BoxShadow(
            offset: Offset(0,3),
             blurRadius: 6, 
             color: kShadowColor
             ),
        ]
      ),
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            height: 90,
            ),
          Text(
            title, 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              ),
              ),
        ],
      ),
    );
  }
}

class MyClippers extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}


