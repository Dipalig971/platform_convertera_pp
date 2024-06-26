
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertera_pp/provider/dateTime_provider.dart';
import 'package:provider/provider.dart';
import '../../provider/SwitchProvider.dart';
import '../../provider/chat_provider.dart';
import 'package:url_launcher/url_launcher.dart' as url;


class AdaptiveListTile extends StatelessWidget {
  const AdaptiveListTile(
      {super.key, required this.index, this.isForChat = true});

  final int index;
  final bool isForChat;

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<ChatProvider>(context);
    final providerFalse = Provider.of<ChatProvider>(context, listen: false);


    print('Image path: ${providerTrue.personData[index].imgPath}');

    return (Provider.of<SwitchProvider>(context).isActive)
        ?
    Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onLongPress: () {
          providerFalse.cupertinosheet(
              context, providerTrue, providerFalse, index);
          Provider.of<AddProvider>(context, listen: false)
              .clearController();
        },
        child: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: CupertinoListTile(
            leadingSize: 50,
            title: Text(providerTrue.personData[index].name.toString()),
            subtitle: isForChat
                ? Text(providerTrue.personData[index].chat
                .toString())
                : Text(providerTrue.personData[index].number
                .toString()),
            leading: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: providerTrue.personData[index].imgPath != null
                    ? DecorationImage(
                    fit: BoxFit.cover,
                    image: FileImage(
                        providerTrue.personData[index].imgPath!))
                    : null,
                color: providerTrue.personData[index].imgPath == null
                    ? CupertinoColors.activeBlue
                    : null,
              ),
              child: providerTrue.personData[index].imgPath == null
                  ? Icon(
                CupertinoIcons.camera,
                color: CupertinoColors.white,
              )
                  : null,
            ),
            trailing: isForChat
                ? Text(
              "${providerTrue.personData[index].dateTime!.day}-${providerTrue.personData[index].dateTime!.month}-${providerTrue.personData[index].dateTime!.year}, ${providerTrue.personData[index].timeOfDay!.hour}:${providerTrue.personData[index].timeOfDay!.minute}",
              style: TextStyle(fontSize: 15),
            )
                : CupertinoButton(
              child: Icon(
                CupertinoIcons.phone,
                color: CupertinoColors.activeGreen,
              ),
              onPressed: () {
                Uri uri = Uri.parse(
                    'tel: +91 ${providerTrue.personData[index].number}');
                url.launchUrl(uri);
              },
            ),
          ),
        ),
      ),
    ):Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      child: ListTile(
        onLongPress: () {
          providerFalse.bottomSheet(
              context, providerTrue, providerFalse, index);
          Provider.of<AddProvider>(context, listen: false)
              .clearController();
        },
        title: Text(providerTrue.personData[index].name.toString()),
        subtitle: isForChat
            ? Text(providerTrue.personData[index].chat
            .toString())
            : Text(providerTrue.personData[index].number.toString()),
        leading: CircleAvatar(
          radius: 35,
          backgroundImage: providerTrue.personData[index].imgPath != null
              ? FileImage(providerTrue.personData[index].imgPath!)
              : null,
          child: providerTrue.personData[index].imgPath == null
              ? Icon(Icons.add_a_photo_outlined)
              : null,
        ),
        onTap: () {},
        trailing: isForChat
            ? Text(
            "${providerTrue.personData[index].dateTime!.day}-${providerTrue.personData[index].dateTime!.month}-${providerTrue.personData[index].dateTime!.year}, ${providerTrue.personData[index].timeOfDay!.hour}:${providerTrue.personData[index].timeOfDay!.minute}")
            : IconButton(
            onPressed: () {
              Uri uri = Uri.parse(
                  'tel: +91 ${providerTrue.personData[index].number}');
              url.launchUrl(uri);
            },
            icon: Icon(
              Icons.call,
              color: Colors.green,
            )),
      ),
    );
  }
}
