import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertera_pp/provider/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../provider/SwitchProvider.dart';
import '../../screen/android/homescreen/view/home_screen.dart';
import '../../screen/ios/iso_home_screen.dart';

class AdaptiveScreen extends StatelessWidget {
  const AdaptiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isActive = Provider.of<SwitchProvider>(context).isActive;
    final isDark = Provider.of<ThemeProvider>(context).isDark;

    if (isActive) {
      return Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoTheme(
              data: CupertinoThemeData(
                  brightness: themeProvider.isDark
                      ? Brightness.dark
                      : Brightness.light),
              child: IosHomeScreen(),
            ),
          );
        },
      );
    }
    else {
      return MaterialApp(
        themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: HomeScreen(),
      );
    }
  }
}
