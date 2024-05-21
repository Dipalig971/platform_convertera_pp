import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertera_pp/screen/android/homescreen/view/callsScreen/calls_screen.dart';
import 'package:platform_convertera_pp/screen/android/homescreen/view/chatscreen/chats_screen.dart';
import 'package:platform_convertera_pp/screen/android/homescreen/view/profilescreen/profile.dart';
import 'package:platform_convertera_pp/screen/android/homescreen/view/settingScreen/setting_screen.dart';
import 'package:provider/provider.dart';

import '../../../../provider/SwitchProvider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Platform Converter'),
          actions: [
            Switch(
              value: Provider.of<SwitchProvider>(context).isActive,
              onChanged: (value) {
                Provider.of<SwitchProvider>(context,listen: false).changeSwitchProvider(value);
              },
            ),
          ],
        ),
        body: ContainedTabBarView(
          tabs: const [
            Icon(Icons.person),
            Text('CHATS'),
            Text('CALLS'),
            Text('SETTINGS'),
          ],
          views:   [
            ProfileScreen(),
            ChatScreen(),
            CallScreen(),
            SettingScreen(),
          ],
        ),
        );
  }
}
