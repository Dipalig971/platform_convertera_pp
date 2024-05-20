import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertera_pp/screen/android/homescreen/view/settingScreen/profile_text.dart';
import 'package:provider/provider.dart';
import '../../../../../provider/profileSwitchProvider.dart';
import '../../../../../provider/theme_provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Colors.grey,
            ),
            title: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Profile',
              ),
            ),
            subtitle: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Update Profile Data',
              ),
            ),
            trailing: Switch(
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
                  ? Container(child: ProfileText())
                  : Column();
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 25),
            child: Divider(),
          ),
          ListTile(
            leading: const Icon(
              Icons.light_mode_outlined,
              color: Colors.grey,
            ),
            title: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Theme'),
            ),
            subtitle: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Change Theme',
              ),
            ),
            trailing: Switch(
              value: Provider.of<ThemeProvider>(context).isDark,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false)
                    .changeTheme(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
