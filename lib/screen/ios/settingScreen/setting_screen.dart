import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/profileSwitchProvider.dart';
import '../../../provider/theme_provider.dart';
import 'components/cupertino_text_field.dart';

class IosSettingScreen extends StatelessWidget {
  const IosSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 120),
        child: Column(
          children: [
            CupertinoListTile(
              leading: const Icon(
                CupertinoIcons.person,
                color: CupertinoColors.activeBlue,
              ),
              title: const Text(
                'Profile',
              ),
              subtitle: const Text(
                'Update Profile Data',
                style: TextStyle(fontSize: 15),
              ),
              trailing: CupertinoSwitch(
                value: Provider.of<ProfileSwitchProvider>(context).isactive,
                onChanged: (value) {
                  Provider.of<ProfileSwitchProvider>(context, listen: false)
                      .ischangeProfile(value);
                },
              ),
            ),
            Consumer<ProfileSwitchProvider>(
              builder: (context, ProfileSwitchProvider, child) {
                return ProfileSwitchProvider.isactive
                    ? Container(
                        child: CupertinoProfileText(),
                      )
                    : Column();
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 20),
              child: Divider(),
            ),
            CupertinoListTile(
              leading: const Icon(
                CupertinoIcons.sun_max,
                color: CupertinoColors.activeBlue,
              ),
              title: const Text(
                'Theme',
              ),
              subtitle: const Text(
                'Change Theme',
                style: TextStyle(fontSize: 15),
              ),
              trailing: CupertinoSwitch(
                value: Provider.of<ThemeProvider>(context).isDark,
                onChanged: (value) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .changeTheme(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
