import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/adaptive/save_adaptive.dart';
import 'components/cupertino_text_field.dart';
import 'components/date_picker.dart';
import 'components/time_picker.dart';




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

class IosProfileScreen extends StatelessWidget {
  const IosProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 130),
            child: GestureDetector(
              onTap: () {
                getImage(); // Update the UI when an image is selected
              },
              child: CircleAvatar(
                backgroundColor: CupertinoColors.activeBlue,
                radius: 70,
                backgroundImage: image != null ? FileImage(image!) : null,
                child: image == null
                    ? const Icon(
                        CupertinoIcons.camera,
                        size: 30,
                        color: CupertinoColors.white,
                      )
                    : null,
              ),
            ),
          ),
          Cupertino_Text_Filed(),
          SizedBox(height: 10,),
          date_picker(context),
          time_picker(context),
          const SizedBox(
            height: 50,
          ),
         const Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             AdaptiveSaveButton()
           ],
         )
        ],
      ),
    );
  }

}
