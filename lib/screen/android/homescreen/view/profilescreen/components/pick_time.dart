import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/dateTime_provider.dart';

InkWell PickTimeMethod(BuildContext context) {
  final ProviderTrue = Provider.of<AddProvider>(context, listen: true);
  final ProviderFalse = Provider.of<AddProvider>(context, listen: false);
  return InkWell(
    onTap: () async {
      ProviderFalse.setTime(
          timeOfDay: await showTimePicker(
              context: context, initialTime: TimeOfDay.now())?? TimeOfDay.now());
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
          ProviderTrue.timeOfDay == null
              ? "Pick Time"
              : "${ProviderTrue.timeOfDay!.hour.toString() + ":" + ProviderTrue.timeOfDay!.minute.toString()}",style: TextStyle(fontSize: 20),
        ),
      ],
    ),
  );
}
