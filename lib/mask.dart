import 'package:flutter/material.dart';
import 'dart:io';
//Submitted by: Mary Eddythe SORNITO BSIT2B
import 'package:image_picker/image_picker.dart';
import 'package:obscura/custom_icons.dart';
import 'package:tflite/tflite.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:obscura/main.dart';

import 'home.dart';

class Mask extends StatefulWidget {
  @override
  _MaskState createState() => _MaskState();
}

class _MaskState extends State<Mask> {
  final style = TextStyle(fontSize: 62);
  bool loading = true;
  File? file;
  var output;
  var label;
  var fine;
  ImagePicker image = ImagePicker();
  var gfg = {
    'Mask Detected': 'Responsible citizen',
    'No mask detection': 'Proceed to pay fine',
  };

  @override
  void initState() {
    super.initState();
    loadmodel().then((value) {
      setState(() {});
    });
  }

  detectimage(File l) async {
    var prediction = await Tflite.runModelOnImage(
      path: l.path,
      numResults: 2,
      threshold: 0.6,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      output = prediction;
      label = (output[0]['label']).toString().substring(2);
      fine = gfg[label];
      loading = false;
    });
  }

  loadmodel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    )??"";
  }

  @override
  void dispose() {
    super.dispose();
  }

  getImageFromCamera() async {
    var img = await image.pickImage(source: ImageSource.camera);

    setState(() {
      file = File(img!.path);
    });
    detectimage(file!);
  }

  getImageFromGallery() async {
    var img = await image.pickImage(source: ImageSource.gallery);

    setState(() {
      file = File(img!.path);
    });
    detectimage(file!);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView (
        child: Column(
           children: <Widget>[
              ClipPath(
                clipper: MyClipper(),
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
                          top: 70,
                          left: 105,
                          child: Text('Mask Detection',
                           style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                 color: Colors.white,
                                  fontSize: 23
                            ),
                          )
                          ),
                    ],
                  ),
     
         
     
         
                )
              ),
              SizedBox(height: 10),
              Container(
          height: h,
          width: w,
          child: Column(
            children: [
              loading == true
             
                  ? Container()
                  : Container(
                      child: Column(
                       
                        children: [
                          Container(
                            child:
                            Image.file(file!),
                            height: 350,
                            width: 500,
                          ),
                        SizedBox(
                        height: 20,
                             ),
                          Text(
                            'Result: ' +
                            (output![0]['label']).toString().substring(2),
                            style: GoogleFonts.inconsolata(
                               textStyle: style,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                               fontSize: 23
                          ),
                         ),
                        ],
                      ),
                    ),
              //SizedBox(
                //height: 1,
                //width: 10,
             // ),
              Column(
        children: [
          SizedBox(
        height: 70,
          ),
         
          ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff8EBBFF)),
          foregroundColor: MaterialStateProperty.all<Color>(Color(0xff0E2958)),
        ),  // <-- ElevatedButton
        onPressed: getImageFromGallery,
        icon: Icon(
          CustomIcons.photo,
          size: 24.0,
        ),
        label: Text('Insert from Gallery',
        style: GoogleFonts.poppins(
         textStyle: style,
          color: Color(0xff0E2958),
          fontSize: 15
        ),
        ),
          ),
         
      
      
          ElevatedButton.icon(
          style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff8EBBFF)),
          foregroundColor: MaterialStateProperty.all<Color>(Color(0xff0E2958)),
           ), // <-- ElevatedButton
        onPressed: getImageFromCamera,
        icon: Icon(
          CustomIcons.gallery,
          size: 20.0,
        ),
        label: Text('Insert from Camera',
        style: GoogleFonts.poppins(
         textStyle: style,
          color: Color(0xff0E2958),
          fontSize: 15
        ),
          ),
          ),
         
           ],
          ),
            ]
        ),
        )
      
           ]
        ),
      )
        );

 
    
  }
}


class MyClipper extends CustomClipper<Path>{
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



