import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertera_pp/modal/image_modal.dart';

class ImageProvider extends ChangeNotifier{
  ImagePicker Picker = ImagePicker();
  File? imagePath;
  File? ProfileimagePath;

  void ImagePath() async {
    XFile? image=await Picker.pickImage(source: ImageSource.camera);
    imagePath = File(image!.path);
    notifyListeners();
  }
  void ProfleimagePath() async {
    XFile? image=await Picker.pickImage(source: ImageSource.camera);
    imagePath = File(image!.path);
    notifyListeners();
  }
}

String imageAll='';

class Image_Provider extends ChangeNotifier {
  addImage a1 = addImage(img: File(""));

  ImageCamera() async {
    ImagePicker picker = ImagePicker();

    XFile? xFile = await picker.pickImage(source: ImageSource.camera);

    String path = xFile!.path;

    a1.img = File(path);

    imageAll = a1.img.path;

    notifyListeners();
  }

  ImageGallery() async {
    ImagePicker picker = ImagePicker();

    XFile? xFile = await picker.pickImage(source: ImageSource.gallery);
    String path = xFile!.path;
    a1.img = File(path);
    imageAll = a1.img.path;
    notifyListeners();
  }

  ClearImage() {
    a1.img = File("");
    notifyListeners();
  }
}