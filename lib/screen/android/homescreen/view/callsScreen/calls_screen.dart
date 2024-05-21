

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as url;

import '../../../../../provider/SwitchProvider.dart';
import '../../../../../provider/chat_provider.dart';
import '../../../../../utils/adaptive/circle_avatar.dart';


class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAndroid =
        Provider.of<SwitchProvider>(context, listen: true).isActive;
    final providerTrue = Provider.of<ChatProvider>(context);

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: providerTrue.personData.length,
            itemBuilder: (context, index) {
              var person = providerTrue.personData[index];
              return ListTile(
                   leading: Adaptive_CircleAvatar(radius: 20),
                  title: Text(person.name ?? "No Name"),
                  subtitle: Text(person.chat ?? "No Conversation"),
                  trailing: IconButton(
                    onPressed: () {
                      Uri uri = Uri.parse(
                          'tel: +91 ${providerTrue.personData[index].number}');
                      url.launchUrl(uri);
                    },
                    icon: Icon(Icons.call),
                  ));
            },
          ),
        ),
      ],
    );
  }
}
