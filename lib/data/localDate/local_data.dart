import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';



class LocalDataHelper {
  var box = GetStorage();
  // Remember email and password
  void saveRememberMail(String mail) {
    box.write('mail', mail);
  }
  getRememberMail() {
    var getData = box.read("mail");
    return getData;
  }
}
