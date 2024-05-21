import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../provider/chat_provider.dart';
import '../../../../../utils/adaptive/List_adaptive.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Screen'),
      ),
      body: Consumer<ChatProvider>(
        builder: (context, chatProvider, child) {
          return ListView.builder(
            itemCount: chatProvider?.personData.length,
            itemBuilder: (context, index) {
              return AdaptiveListTile(index: index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Implement the add functionality if needed
        },
      ),
    );
  }
}
