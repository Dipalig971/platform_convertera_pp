import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../provider/dateTime_provider.dart';

InkWell PickDateMethod(BuildContext context) {
  final ProviderTrue = Provider.of<AddProvider>(context, listen: true);
  final ProviderFalse = Provider.of<AddProvider>(context, listen: false);
  return InkWell(
    onTap: () async {
      ProviderFalse.setDate(await showDatePicker(
              context: context,
              firstDate: DateTime(1930),
              lastDate: DateTime(2040)) ??
          DateTime.now());
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
          ProviderTrue.dateTime == null
              ? "Pick Time"
              : "${ProviderTrue.dateTime!.day.toString() + ":" + ProviderTrue.dateTime!.month.toString() + ":" + ProviderTrue.dateTime!.year.toString()}",style: TextStyle(fontSize: 20),
        ),
      ],
    ),
  );
}
