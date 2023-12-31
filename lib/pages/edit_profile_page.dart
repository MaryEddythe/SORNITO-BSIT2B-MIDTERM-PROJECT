import 'package:image_picker/image_picker.dart';
import 'package:obscura/pages/button_widget.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:obscura/pages/profile_widget.dart';
import 'package:obscura/pages/textfield_widget.dart';
import 'package:obscura/pages/user.dart';
import 'package:obscura/pages/user_preference.dart';
import 'package:obscura/pages/appbar_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';


class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late User user;

  @override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: buildAppBar(context),
    body: ListView(
    padding: EdgeInsets.symmetric(horizontal: 32),
    physics: BouncingScrollPhysics(),
    children: [
      ProfileWidget(
        imagePath: user.imagePath,
        isEdit: true,
        onClicked: () async{
          final image = await ImagePicker()
          .getImage(source: ImageSource.gallery);

          if (image == null) return;

                    final directory = await getApplicationDocumentsDirectory();
                    final name = basename(image.path);
                    final imageFile = File('${directory.path}/$name');
                    final newImage =
                        await File(image.path).copy(imageFile.path);
           setState(() => user = user.copy(imagePath: newImage.path));
        }
      ),
       const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Full Name',
                  text: user.name,
                  onChanged: (name) => user = user.copy(name: name),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Email',
                  text: user.email,
                  onChanged: (email) => user = user.copy(email: email),
                ),
                const SizedBox(height: 24),
                TextFieldWidget(
                  label: 'Bio',
                  text: user.about,
                  maxLines: 5,
                  onChanged: (about) => user = user.copy(about: about),
                ),
                const SizedBox(height: 24),
                ButtonWidget(
                  text: 'Save',
                  onClicked: () {
                    UserPreferences.setUser(user);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
      
            
        
}