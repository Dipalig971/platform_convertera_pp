import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../../provider/dateTime_provider.dart';

CupertinoButton date_picker(context) {
  final ProviderTrue = Provider.of<AddProvider>(context, listen: true);
  final ProviderFalse = Provider.of<AddProvider>(context, listen: false);
  return CupertinoButton(
    child: Row(
      children: [
        Icon(
          CupertinoIcons.calendar,
          size: 22,
        ),
        SizedBox(width: 10,),
        Text(
          ProviderTrue.dateTime == null
              ? "Pick Date"
              : "${ProviderTrue.dateTime!.day.toString() + "-" + ProviderTrue.dateTime!.month.toString() + "-" + ProviderTrue.dateTime!.year.toString()}",
        ),
      ],
    ),
    onPressed: () {
      CupertinoDatePicker(
        onDateTimeChanged: (value) {
          ProviderFalse.setDate(value);
        },
      );
    },
  );
}
