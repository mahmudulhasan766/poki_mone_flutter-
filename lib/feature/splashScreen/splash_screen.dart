import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/core/routes.dart';
import 'package:task_app/utils/dimensions.dart';
import 'package:task_app/utils/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _route();
  }

  void _route() {
    Timer(const Duration(seconds: 2), () async {
      Get.offNamed(Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeExtraLarge),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(Images.logo,height: 90,width: 90,),
                  const SizedBox(height: Dimensions.paddingSizeExtraLarge,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
