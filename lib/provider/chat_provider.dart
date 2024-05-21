import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../modal/platform_modal.dart';
import '../screen/android/homescreen/view/profilescreen/components/text_field.dart';
import '../screen/ios/profileScreen/components/cupertino_text_field.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController numberController = TextEditingController();
final TextEditingController chatsController = TextEditingController();
final TextEditingController dateController = TextEditingController();
final TextEditingController timeController = TextEditingController();

class ChatProvider extends ChangeNotifier {
  List<ProfileData> personData = [];

  void addData(ProfileData data) {
    personData.add(data);
    notifyListeners();
  }

  Future<void> deleteData(int index) async {
    if (index >= 0 && index < personData.length) {
      await Future.delayed(Duration(milliseconds: 200));
      personData.removeAt(index);
      notifyListeners();
    }
  }

  void updateData(int index, ProfileData updatedData) {
    personData[index] = updatedData;
    notifyListeners();
  }

  void updateControllerForEditing(String name, String phone, String chat) {
    nameController.text = name;
    numberController.text = phone;
    chatsController.text = chat;
  }

  Future<dynamic> bottomSheet(BuildContext context, ChatProvider providerTrue,
      ChatProvider providerFalse, int index) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 300,
        alignment: Alignment.center,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 10),
            CircleAvatar(
              radius: 50,
              child: providerTrue.personData[index].imgPath == null
                  ? Icon(Icons.add_a_photo_outlined)
                  : null,
              backgroundImage: providerTrue.personData[index].imgPath != null
                  ? FileImage(providerTrue.personData[index].imgPath!)
                  : null,
            ),
            Text(
              providerTrue.personData[index].name ?? '',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Text(providerTrue.personData[index].chat ?? ''),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    providerFalse.updateControllerForEditing(
                      providerFalse.personData[index].name ?? '',
                      providerFalse.personData[index].number ?? '',
                      providerFalse.personData[index].chat ?? '',
                    );
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Edit Details"),
                        content: Container(
                          height: 370,
                          width: 400,
                          child: Column(
                            children: [Text_field_method()],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              providerFalse.updateData(
                                index,
                                ProfileData(
                                  name: nameController.text,
                                  number: numberController.text,
                                  chat: chatsController.text,
                                  timeOfDay: providerFalse.personData[index].timeOfDay,
                                  dateTime: providerFalse.personData[index].dateTime,
                                  imgPath: providerFalse.personData[index].imgPath,
                                ),
                              );
                              Navigator.pop(context);
                            },
                            child: Text("Save"),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    providerFalse.deleteData(index);
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
          ],
        ),
      ),
    );
  }

  void cupertinosheet(BuildContext context, ChatProvider providerTrue,
      ChatProvider providerFalse, int index) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => Container(
        height: 300,
        alignment: Alignment.center,
        width: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 10),
            CircleAvatar(
              radius: 50,
              child: providerTrue.personData[index].imgPath == null
                  ? Icon(Icons.add_a_photo_outlined)
                  : null,
              backgroundImage: providerTrue.personData[index].imgPath != null
                  ? FileImage(providerTrue.personData[index].imgPath!)
                  : null,
            ),
            Text(
              providerTrue.personData[index].name ?? '',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Text(providerTrue.personData[index].chat ?? ''),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () {
                    providerFalse.updateControllerForEditing(
                      providerFalse.personData[index].name ?? '',
                      providerFalse.personData[index].number ?? '',
                      providerFalse.personData[index].chat ?? '',
                    );
                    Navigator.pop(context);
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: Text("Edit Details"),
                        content: Container(
                          height: 270,
                          width: 400,
                          child: Column(
                            children: [Cupertino_Text_Filed()],
                          ),
                        ),
                        actions: [
                          CupertinoButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                          ),
                          CupertinoButton(
                            onPressed: () {
                              providerFalse.updateData(
                                index,
                                ProfileData(
                                  name: nameController.text,
                                  number: numberController.text,
                                  chat: chatsController.text,
                                  timeOfDay: providerFalse.personData[index].timeOfDay,
                                  dateTime: providerFalse.personData[index].dateTime,
                                  imgPath: providerFalse.personData[index].imgPath,
                                ),
                              );
                              Navigator.pop(context);
                            },
                            child: Text("Save"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Icon(Icons.edit),
                ),
                CupertinoButton(
                  onPressed: () {
                    Navigator.pop(context);
                    providerFalse.deleteData(index);
                  },
                  child: Icon(Icons.delete),
                ),
              ],
            ),
            CupertinoButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
          ],
        ),
      ),
    );
  }
}
