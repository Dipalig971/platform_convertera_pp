import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../../provider/dateTime_provider.dart';

CupertinoButton time_picker(context) {
  final ProviderTrue = Provider.of<AddProvider>(context, listen: true);
  final ProviderFalse = Provider.of<AddProvider>(context, listen: false);
  return CupertinoButton(
    child: Row(
      children: [
        const Icon(
          CupertinoIcons.alarm,
          size: 22,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          ProviderTrue.dateTime == null
              ? "Pick Time"
              : "${ProviderTrue.timeOfDay!.hour.toString() + ":" + ProviderTrue.timeOfDay!.minute.toString()}",),
     ],
    ),
    onPressed: () {
      CupertinoTimerPicker(
        onTimerDurationChanged: (value) {
          ProviderFalse.setTime(duration: value);
        },
      );
    },
  );
}
