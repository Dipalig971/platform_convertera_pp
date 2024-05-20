import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../provider/theme_provider.dart';

GestureDetector time_picker(context) {
  return GestureDetector(
    onTap: () {
      CupertinoTimerPicker(
        onTimerDurationChanged: (value) {},
      );
    },
    child:Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Icon(
            CupertinoIcons.alarm,
            size: 22,
          ),
        ),
        Text('Pick Time',style: TextStyle(color: Provider.of<ThemeProvider>(context).isDark ? CupertinoColors.white : CupertinoColors.black ))
      ],
    ),
  );
}