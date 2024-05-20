import 'package:flutter/cupertino.dart';

import '../../../../utils/text_editing_controllers.dart';
import '../../../android/homescreen/view/profilescreen/profile.dart';

Column Cupertino_Text_Filed() {
  return Column(
    children: [
      const SizedBox(height: 20,),
      CupertinoTextField(
        controller: nameController,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: CupertinoColors.systemGrey),
          borderRadius: BorderRadius.circular(15),
        ),
        placeholder: 'Full Name',
        prefix: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(CupertinoIcons.person, color: CupertinoColors.activeBlue),
        ),
      ),
      const SizedBox(height: 20),
      CupertinoTextField(
        controller: nameController,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: CupertinoColors.systemGrey),
          borderRadius: BorderRadius.circular(15),
        ),
        placeholder: 'Phone number',
        prefix: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(CupertinoIcons.phone, color: CupertinoColors.activeBlue),
        ),
      ),
      const SizedBox(height: 20),
      CupertinoTextField(
        controller: nameController,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(color: CupertinoColors.systemGrey),
          borderRadius: BorderRadius.circular(15),
        ),
        placeholder: 'Chat Conversation',
        prefix: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(CupertinoIcons.chat_bubble, color: CupertinoColors.activeBlue),
        ),
      ),
    ],
  );
}