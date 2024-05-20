import 'package:flutter/cupertino.dart';
import 'package:platform_convertera_pp/screen/ios/profileScreen/profile_screen.dart';
import 'package:platform_convertera_pp/screen/ios/settingScreen/setting_screen.dart';
import 'package:provider/provider.dart';

import '../../provider/SwitchProvider.dart';
import 'callsScreen/call_screen.dart';
import 'chatsScreen/chat_screen.dart';

class IosHomeScreen extends StatelessWidget {
  const IosHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Text('Platform Converter'),
          trailing: CupertinoSwitch(
            value: Provider.of<SwitchProvider>(context).isActive,
            onChanged: (value) {
              Provider.of<SwitchProvider>(context, listen: false)
                  .changeSwitchProvider(value);
            },
          ),
        ),
        child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person), label: 'Profile'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.chat_bubble), label: 'chats'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.phone), label: 'calls'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings), label: 'Settings'),
            ]),
            tabBuilder: (context, index) {
              return CupertinoTabView(
                builder: (context) {
                  switch (index) {
                    case 0:
                      return IosProfileScreen();
                      break;
                    case 1:
                      return IosChatScreen();
                      break;
                    case 2:
                      return IosCallScreen();
                      break;
                    case 3:
                      return IosSettingScreen();
                      break;
                  }
                  return Column();
                },
              );
            }));
  }
}
