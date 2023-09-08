import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NumbersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, '2', 'Developers'),
          buildDivider(),
          buildButton(context, 'BSIT-2B', 'Section'),
          buildDivider(),
          buildButton(context, 'CIT209', 'Subject'),
        ],
      );

      Widget buildDivider() => Container(
        height: 24,
        child: VerticalDivider(),
        //color: Color(0xff008080),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 18
                            ),
           ),
            
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ]
        ),
        );
      
 }
