import 'package:flutter/material.dart';
import 'package:platform_convertera_pp/provider/SwitchProvider.dart';
import 'package:platform_convertera_pp/provider/chat_provider.dart';
import 'package:platform_convertera_pp/provider/dateTime_provider.dart';
import 'package:platform_convertera_pp/provider/image_provider.dart';
import 'package:platform_convertera_pp/provider/profileSwitchProvider.dart';
import 'package:platform_convertera_pp/provider/theme_provider.dart';
import 'package:platform_convertera_pp/utils/adaptive/adaptive.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const PlatformConverterAPP());
}

class PlatformConverterAPP extends StatelessWidget {
  const PlatformConverterAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SwitchProvider(),),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        // ChangeNotifierProvider(create: (context) => PlatformProvider()),
        // ChangeNotifierProvider(create: (context) => ConverterProvider()),
        ChangeNotifierProvider(create: (context) => ChatConversationProvider(),),
        ChangeNotifierProvider(create: (context) => ProfileSwitchProvider(),),
        ChangeNotifierProvider(create: (context) => AddProvider(),),
        ChangeNotifierProvider(create: (context) => Image_Provider(),),
      ],
      child: AdaptiveScreen(),
      // builder:(context, child) => MaterialApp(
      //   debugShowCheckedModeBanner: false,
      //   // home: ProfileScreen(),
      //   routes: {
      //     '/':(context) => AdaptiveScreen(),
      //   },
      // ),
    );
  }
}

