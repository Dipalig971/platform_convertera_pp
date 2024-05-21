import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../provider/SwitchProvider.dart';
import '../../../../../../utils/adaptive/text_field_adaptive.dart';
import '../profile.dart';


class Text_field_method extends StatelessWidget {
  const Text_field_method({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdaptiveTextField(
          controller: nameController!,
          hintText: "Full Name",
          icon: (Provider.of<SwitchProvider>(context).isActive)
              ? const Icon(Icons.person)
              : const Icon(CupertinoIcons.person),
        ),
        AdaptiveTextField(
          controller: numberController!,
          hintText: "Phone Number",
          icon: (Provider.of<SwitchProvider>(context).isActive)
              ? const Icon(Icons.phone)
              : const Icon(CupertinoIcons.phone),
        ),
        AdaptiveTextField(
          controller: chatsController!,
          hintText: "Chat Conversation",
          icon: (Provider.of<SwitchProvider>(context).isActive)
              ? const Icon(Icons.chat)
              : const Icon(CupertinoIcons.chat_bubble_text_fill),
        ),
      ],
    );
  }
}