import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../provider/theme_provider.dart';

GestureDetector date_picker(context) {
  return GestureDetector(
    onTap: () {
      CupertinoDatePicker(
        onDateTimeChanged: (value) {
          // ProviderFalse.set
        },
      );
    },
    child:  Row(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Icon(
            CupertinoIcons.calendar,
            size: 22,
          ),
        ),
        Text('Pick Date',style: TextStyle(color: Provider.of<ThemeProvider>(context).isDark ? CupertinoColors.white : CupertinoColors.black  ),)
      ],
    ),
  );
}