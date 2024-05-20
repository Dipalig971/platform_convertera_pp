import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../screen/android/homescreen/view/profilescreen/profile.dart';
import '../utils/text_editing_controllers.dart';


class AddProvider extends ChangeNotifier {
  DateTime? dateTime;
  TimeOfDay? timeOfDay;
  Duration? duration;
  ImagePicker imagePicker = ImagePicker();
  File? imgpath;

  void setDate(DateTime? dateTime) {
    this.dateTime = dateTime;
    notifyListeners();
  }

  void setTime({TimeOfDay? timeOfDay, Duration? duration}) {
    this.duration = duration;
    this.timeOfDay = timeOfDay;

    if (duration != null) {
      final int hours = duration.inHours % 24;
      final int minutes = duration.inMinutes % 60;
      this.timeOfDay = TimeOfDay(hour: hours, minute: minutes);
    }


    notifyListeners();
  }

  Future<void> pickImage() async {
    XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
    imgpath = File(image!.path);
    notifyListeners();
  }

  void clearController() {
    nameController!.clear();
    numberController!.clear();
    chatsController!.clear();
    notifyListeners();
  }
}