import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../utils/text_editing_controllers.dart';
import '../../../android/homescreen/view/profilescreen/profile.dart';

Widget CupertinoProfileText() {
  return Column(
    children: [
      GestureDetector(
        onTap: () async {
          await getImage();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: CircleAvatar(
            radius: 70,
            backgroundColor: CupertinoColors.activeBlue,
            backgroundImage: image != null ? FileImage(image!) : null,
            child: image == null
                ? const Icon(
                    Icons.camera_alt_outlined,
                    size: 30,
                    color: CupertinoColors.extraLightBackgroundGray,
                  )
                : null,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 160, right: 120),
        child: CupertinoTextField(
          controller: txtname,
          placeholder: '  Enter your name...',
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 160, right: 120),
        child: CupertinoTextField(
          controller: txtname,
          placeholder: '   Enter your bio...',
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 170, top: 10),
        child: Row(
          children: [
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Save',
                  style: TextStyle(
                      color: CupertinoColors.activeBlue, fontSize: 18),
                )),
            TextButton(
              onPressed: () {},
              child: const Text('clear',
                  style: TextStyle(
                      color: CupertinoColors.activeBlue, fontSize: 18)),
            )
          ],
        ),
      )
    ],
  );
}
