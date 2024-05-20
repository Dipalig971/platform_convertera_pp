import 'package:flutter/material.dart';

import '../../../../../../utils/text_editing_controllers.dart';
import '../profile.dart';

InkWell PickDateMethod(BuildContext context) {
  return InkWell(
    onTap: () async {
      DateTime selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1987),
        lastDate: DateTime(2030),
      ) ??
          DateTime.now();
      print(selectedDate);
      dateController.text = "${selectedDate.toLocal()}".split(' ')[0];
    },
    child: Row(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Icon(
            Icons.calendar_month_outlined,
            size: 22,
          ),
        ),
        Text(
          dateController.text.isEmpty
              ? 'Pick Date'
              : dateController.text,
          style: const TextStyle(fontSize: 18),
        )
      ],
    ),
  );
}