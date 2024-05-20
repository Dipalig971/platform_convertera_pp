import 'package:flutter/material.dart';

import '../../../../../../utils/text_editing_controllers.dart';
import '../profile.dart';

Column Text_field_method() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: TextField(
          controller: nameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 3),
            ),
            hintText: 'Full Name',
            labelText: 'Full Name',
            prefixIcon: const Icon(Icons.person_2_outlined),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: TextField(
          controller: numberController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 3),
            ),
            hintText: 'Phone Number',
            labelText: 'Phone Number',
            prefixIcon: const Icon(Icons.phone),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: TextField(
          controller: chatsController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 3),
            ),
            hintText: 'Chat Conversation',
            labelText: 'Chat Conversation',
            prefixIcon: const Icon(Icons.message_outlined),
          ),
        ),
      ),
    ],
  );
}