import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:task_app/data/localDate/local_data.dart';

class LoginController extends GetxController{
  var isValue=false;
  isValueUpdate(value){
    isValue = value!;
    update();
  }
  setValue(String mail){
    LocalDataHelper().saveRememberMail(mail);
  }
}