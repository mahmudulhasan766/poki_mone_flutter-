import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_app/components/custom_button.dart';
import 'package:task_app/components/custom_text_field.dart';
import 'package:task_app/controller/login_controller.dart';
import 'package:task_app/core/routes.dart';
import 'package:task_app/data/localDate/local_data.dart';
import 'package:task_app/utils/dimensions.dart';
import 'package:task_app/utils/images.dart';
import 'package:task_app/utils/styles.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        builder: (controller){
          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 109,),
                    SvgPicture.asset(Images.icon,height: 48,width: 48),
                    const SizedBox(height: 29,),
                    Text("Sign in",
                      style: interSemiBold.copyWith(
                          color: const Color(0xff101828),
                          fontSize: 24
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text("Welcome back! Please enter your details.",
                        style: interRegular.copyWith(
                            color: const Color(0xff475467),
                            fontSize: 16
                        )
                    ),
                    const SizedBox(height: 29,),
                    Text("Email",
                      style: interMedium.copyWith(
                          color: const Color(0xff344054),
                          fontSize: 14
                      ),
                    ),
                    const SizedBox(height: 6,),
                    Container(
                      //height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color:  const Color(0xffD0D5DD)),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(Dimensions.paddingSizeExtraSmall)),
                      ),
                      child: CustomTextField(
                        hintText: 'Enter your email',
                        controller: emailController,
                        inputType: TextInputType.visiblePassword,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(right:0),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: Dimensions.paddingSizeDefault,
                              top: Dimensions.paddingSizeDefault,
                              bottom: Dimensions.paddingSizeDefault,
                            ),

                          ),
                        ),
                        //isPassword: true,
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Text("Password",
                      style: interMedium.copyWith(
                          color: const Color(0xff344054),
                          fontSize: 14
                      ),),
                    const SizedBox(height: 6,),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xffD0D5DD)),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(Dimensions.paddingSizeExtraSmall)),
                      ),
                      child: CustomTextField(
                        hintText: 'Enter your password',
                        controller: passwordController,
                        inputType: TextInputType.visiblePassword,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(right:0),
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: Dimensions.paddingSizeDefault,
                              top: Dimensions.paddingSizeDefault,
                              bottom: Dimensions.paddingSizeDefault,
                            ),
                          ),
                        ),
                        isPassword: true,
                      ),
                    ),

                    const SizedBox(height: 24,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                              value: Get.find<LoginController>().isValue,
                              checkColor: Colors.white,
                              activeColor: Theme.of(context).primaryColor,
                              focusColor: Theme.of(context).primaryColor,
                              side: const BorderSide(color:Color(0xffD0D5DD)),
                              onChanged: (value) {
                                Get.find<LoginController>().isValueUpdate(value);
                              },
                            ),
                            Text("Remember for 30 days",
                                style: interMedium.copyWith(
                                    color: const Color(0xff344054),
                                    fontSize: 14
                                )
                            )
                          ],
                        ),
                        Text("Forgot password",
                          style: interSemiBold.copyWith(
                              color: const Color(0xff6941C6),
                              fontSize: 14
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24,),
                    CustomButton(
                      buttonText: "Sign in",
                      onPressed: (){
                        if(emailController.text.isNotEmpty) {
                          if (controller.isValue) {
                            LocalDataHelper().saveRememberMail(emailController.text.toString());
                          }else{
                            LocalDataHelper().box.remove('mail');
                          }
                          Get.offAllNamed(Routes.home);
                        }else{
                          Get.showSnackbar(
                            GetSnackBar(
                            backgroundColor:Colors.red,
                            message: "Please enter your email",
                            maxWidth: Get.width,
                            duration: const Duration(seconds: 2),
                            snackStyle: SnackStyle.FLOATING,
                            margin: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                            borderRadius: Dimensions.radiusSmall,
                            isDismissible: true,
                            dismissDirection: DismissDirection.horizontal,),
                          );
                        }

                      },
                    ),
                    const SizedBox(height: 29,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don’t have an account?",
                            style: interRegular.copyWith(
                                color: const Color(0xff475467),
                                fontSize: 14
                            )
                        ),
                        const SizedBox(width: 4),
                        Text("Sign up",
                            style: interSemiBold.copyWith(
                                color: const Color(0xff6941C6),
                                fontSize: 14
                            )
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
