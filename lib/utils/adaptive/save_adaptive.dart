

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertera_pp/modal/platform_modal.dart';
import 'package:platform_convertera_pp/provider/dateTime_provider.dart';
import 'package:provider/provider.dart';
import '../../provider/SwitchProvider.dart';
import '../../provider/chat_provider.dart';

class AdaptiveSaveButton extends StatelessWidget {
  const AdaptiveSaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return (Provider.of<SwitchProvider>(context).isActive)
        ?
    CupertinoButton(
      child: Container(
          height: 45,
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: CupertinoColors.activeBlue,
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            "Save",
            style: TextStyle(color: CupertinoColors.white),
          )),
      onPressed: () {
        Provider.of<ChatProvider>(context, listen: false).addData(
            ProfileData(
                imgPath:
                Provider.of<
                    AddProvider>(context, listen: false)
                    .imgpath ??
                    null,
                chat:
                chatsController !=
                    null
                    ? chatsController!.text
                    : "",
                name: nameController != null ? nameController!.text : "",
                number:
                numberController != null ? numberController!.text : "",
                dateTime: Provider.of<AddProvider>(context,
                    listen: false)
                    .dateTime ??
                    DateTime.now(),
                timeOfDay:
                Provider.of<AddProvider>(context, listen: false)
                    .timeOfDay ??
                    TimeOfDay.now()));
        Provider.of<AddProvider>(context, listen: false).imgpath =
        null;

        Provider.of<AddProvider>(context, listen: false)
            .clearController();
      },
    ):OutlinedButton(
        onPressed: () {
          Provider.of<ChatProvider>(context, listen: false).addData(
              ProfileData(
                  imgPath:
                  Provider.of<AddProvider>(context, listen: false)
                      .imgpath ??
                      null,
                  chat: chatsController?.text ?? "",
                  name: nameController != null ? nameController!.text : "",
                  number:
                  numberController != null ? numberController!.text : "",
                  dateTime: Provider.of<AddProvider>(context,
                      listen: false)
                      .dateTime ??
                      DateTime.now(),
                  timeOfDay:
                  Provider.of<AddProvider>(context, listen: false)
                      .timeOfDay ??
                      TimeOfDay.now()));
          Provider.of<AddProvider>(context, listen: false).imgpath =
          null;
          Provider.of<AddProvider>(context, listen: false)
              .clearController();
        },
        child: Text("Save"));
  }
}
