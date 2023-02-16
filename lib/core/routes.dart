import 'package:get/get.dart';
import 'package:task_app/feature/auth/login_screen.dart';
import 'package:task_app/feature/home/home_screen.dart';
import 'package:task_app/feature/splashScreen/splash_screen.dart';

class Routes {
  static const String home = '/home';
  static const String splash = '/splash';
  static const String login = '/login';

  static String getHome() => home;


  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: login, page: () => LoginScreen()),
  ];
}
