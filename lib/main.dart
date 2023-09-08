import 'package:flutter/material.dart';
import 'dart:io';
//Submitted by: Mary Eddythe SORNITO BSIT2B
import 'package:image_picker/image_picker.dart';
import 'package:obscura/custom_icons.dart';
import 'package:obscura/pages/user_preference.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'mask.dart';


 Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await UserPreferences.init();

  runApp(MyApp());
}
 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
         primaryColor: Color(0XFF008080),
         dividerColor: Colors.black,
         ),
       home:
       Home(),
     );
   }
 }
