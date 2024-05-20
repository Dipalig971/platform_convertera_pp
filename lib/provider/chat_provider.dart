import 'package:flutter/cupertino.dart';

import '../modal/platform_modal.dart';

class ChatConversationProvider extends ChangeNotifier{
  List<ProfileData> Persondata=[];

  void dataAdd(ProfileData data){
    Persondata.add(data);
    notifyListeners();
  }
}