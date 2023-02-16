import 'package:get/get.dart';
import 'package:task_app/controller/home_controller.dart';
import 'package:task_app/controller/login_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(HomeController());
    Get.lazyPut(() => LoginController());
  }
}