import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant.dart';



class Dashboard extends StatefulWidget{
  @override
  _DashboardState createState ()  => _DashboardState();
}

class _DashboardState extends State <Dashboard>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 340,
              width: double.infinity,
              decoration: BoxDecoration(
              gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
              Color(0xff008080),
              Color(0xff34B6B6),
              ],
            ),
              image: DecorationImage(
              image: AssetImage('assets/images/virus.png'),
              ),
            ),
           
              child: Stack(
                children: <Widget> [
                  SvgPicture.asset(
                    "assets/images/pandemic.svg", 
                    width: 300,
                    height: 350,
                    fit: BoxFit.fitWidth,
                    alignment: AlignmentDirectional.bottomCenter,
                    ),
                    Positioned(
                      top: 55,
                      left: 100,
                      child: Text('Stay masked, Stay protected.',
                       style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15
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
                              text: "Case Update",
                               style: GoogleFonts.poppins(          
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF303030),
                              fontSize: 20,
                               ),
                            ),
                            // TextSpan(
                            //   text: "Newest update May 23",
                            //   style: TextStyle(
                            //     color: Colors.grey,
                            //     fontSize: 10,
                            //   )
                        
                            // ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Last Updated: May 28, 2023",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                
                SizedBox( height: 15),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Counter(
                          color: kRecovercolor,
                          number: 170886,
                          title: "Vaccinated",
                        ),
                        Counter(
                          color: kInfectedColor,
                          number: 8869,
                          title: "Mild Symptoms",
                        ),
                        Counter(
                          color: kDeathColor,
                          number: 66466,
                          title: "Deaths",
                        ),
                      ],
                    ),
              ),
            
               SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Panay Statistics",
                        style: kTitleTextstyle,
                      ),

                       Text(
                        "Last Updated: May 28, 2023",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),

                Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(20),
                    height: 178,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFF015454),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 30,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: 
                    Image.asset(
                      "assets/images/island.png",
                      height: 600,
                      width: 600,
                      //fit: BoxFit.contain,
                        alignment: Alignment.bottomCenter,
                    ),
                  ),
                ],
              ),
            )
                ]
            )
            );
  }
}

class Counter extends StatelessWidget{
  final int number;
  final Color color;
  final String title;
  const Counter({
    Key? key,
    required this.number,
    required this.color,
    required this.title,
  }) : super(key : key);

  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(6),
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: color,
                width: 2,
              )
            )
          ),
        ),
        SizedBox(height: 5),
        Text( 
          "$number",
         style: GoogleFonts.poppins(
          //  fontWeight: FontWeight.bold,
           color: color,
           fontSize: 23
                        ),
        ),
        Text(
          title, 
          style: kSubTextStyle,
          )
      ],
    );
  }

}



class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}



