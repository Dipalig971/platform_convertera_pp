import 'package:flutter/material.dart';

import '../../../../../../utils/text_editing_controllers.dart';
import '../profile.dart';

InkWell PickTimeMethod(BuildContext context) {
  return InkWell(
    onTap: () async {
      TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        orientation: Orientation.portrait,
      );
      if (selectedTime != null) {
        final now = DateTime.now();
        final dateTime = DateTime(now.year, now.month, now.day,
            selectedTime.hour, selectedTime.minute);
        timeController.text = selectedTime.format(context);
        print(dateTime);
      }
    },
    child: Row(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Icon(
            Icons.alarm,
            size: 22,
          ),
        ),
        Text(
          timeController.text.isEmpty
              ? 'Pick Time'
              : timeController.text,
          style: const TextStyle(fontSize: 18),
        )
      ],
    ),
  );
}