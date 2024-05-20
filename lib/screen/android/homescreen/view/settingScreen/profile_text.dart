import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/text_editing_controllers.dart';
import '../../../../ios/profileScreen/profile_screen.dart';

Widget ProfileText() {
  return Column(
    children: [
      InkWell(
        onTap: () async {
          await getImage();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: CircleAvatar(
            radius: 70,
            backgroundImage: image != null ? FileImage(image!) : null,
            child: image == null
                ? const Icon(
              Icons.camera_alt_outlined,
              size: 30,
            )
                : null,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 160,right: 120),
        child: TextField(
            controller: txtname,
            decoration:const InputDecoration(
                hintText: '  Enter your name...'
            )
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 160,right: 120),
        child: TextField(
            controller: txtname,
            decoration:const InputDecoration(
                hintText: '   Enter your bio...'
            )
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 160,vertical: 10),
        child: Row(
          children: [
            TextButton(onPressed: () {

            }, child: Text('Save')),
            TextButton(onPressed: () {

            }, child: Text('clear')),
          ],
        ),
      )
    ],
  );
}