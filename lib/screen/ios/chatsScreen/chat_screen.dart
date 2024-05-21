

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../../provider/chat_provider.dart';
import '../../../utils/adaptive/List_adaptive.dart';



class IosChatScreen extends StatelessWidget {
  const IosChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<ChatProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ...List.generate(
              providerTrue.personData.length,
                  (index) => AdaptiveListTile(
                index: index,
              ))
        ],
      ),
    );
  }
}
