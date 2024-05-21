import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertera_pp/provider/dateTime_provider.dart';
import 'package:platform_convertera_pp/provider/theme_provider.dart';
import 'package:platform_convertera_pp/utils/adaptive/adaptive.dart';
import 'package:platform_convertera_pp/utils/adaptive/save_adaptive.dart';
import 'package:provider/provider.dart';
import 'components/pick_date.dart';
import 'components/pick_time.dart';
import 'components/text_field.dart';


final TextEditingController nameController = TextEditingController();
final TextEditingController numberController = TextEditingController();
final TextEditingController chatsController = TextEditingController();
final TextEditingController dateController = TextEditingController();
final TextEditingController timeController = TextEditingController();


final ImagePicker picker = ImagePicker();
File? image;

Future<void> getImage() async {
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    image = File(pickedFile.path);
  } else {
    print('No image selected');
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () async {
                await getImage();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: image != null ? FileImage(image!) : null,
                  child: image == null
                      ? const Icon(
                    Icons.camera_alt_outlined,
                    size: 30,
                  )
                      : null,
                ),
              ),
            ),
            const Text_field_method(),
            PickDateMethod(context),
            PickTimeMethod(context),
            const SizedBox(
              height: 60,
            ),
             const SingleChildScrollView(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   AdaptiveSaveButton(),
                 ],
               ),
             ),
          ],
        ),
      ),
    );
  }
}