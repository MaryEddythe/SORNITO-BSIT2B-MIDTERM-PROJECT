
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obscura/pages/user_preference.dart';

AppBar buildAppBar(BuildContext context) {

  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
    
    ],
  );
}