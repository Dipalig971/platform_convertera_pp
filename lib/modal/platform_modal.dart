import 'dart:io';

import 'package:flutter/material.dart';

class ProfileData {
  String? name,number,chat;
  DateTime? dateTime;
  TimeOfDay? timeOfDay;
  File? imgPath;

  ProfileData({this.name,this.number,this.chat,this.dateTime,this.timeOfDay,this.imgPath});

}
