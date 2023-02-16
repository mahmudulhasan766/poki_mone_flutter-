import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_app/controller/home_controller.dart';
import 'package:task_app/data/localDate/local_data.dart';
import 'package:task_app/feature/home/widget/dialog.dart';
import 'package:task_app/utils/dimensions.dart';
import 'package:task_app/utils/images.dart';
import '../../utils/styles.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (controller){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Center(
                  child: Text("Logged as: ${LocalDataHelper().getRememberMail()??""}",
                    style: interSemiBold.copyWith(
                      color: const Color(0xff808080),
                      fontSize: 16,
                      fontWeight:  FontWeight.w300,
                    ),
                  ),
                ),
                const SizedBox(height: Dimensions.paddingSizeLarge),
                Text("List of Pokemon",
                    style: interSemiBold.copyWith(
                      color: const Color(0xff101828),
                      fontSize: 16,
                    )
                ),
                const SizedBox(height: Dimensions.paddingSizeExtraSmall),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: controller.pokeMoniModel.results!.length,
                      itemBuilder: (context,index){
                        return Container(
                          decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Color(0xffEAECF0), width: 1),
                                top: BorderSide.none,
                                left: BorderSide.none,
                                right: BorderSide.none,
                              )
                          ),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: Dimensions.paddingSizeDefault,
                                horizontal: Dimensions.paddingSizeExtraLarge
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: CircleAvatar(
                                    backgroundColor: const Color(0xffEDE5FF),
                                    child:  ClipRRect(
                                      borderRadius: BorderRadius.circular(45),
                                      child: SvgPicture.asset(Images.profile),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("${controller.pokeMoniModel.results![index].name}".capitalizeFirst!,
                                        style: interMedium.copyWith(
                                            color: const Color(0xff101828),
                                            fontSize: 14),
                                      ),
                                      Container(
                                          decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.all(Radius.circular(30)),
                                              border: Border.all(width: 2,color: const Color(0xff175CD3))
                                          ),
                                          child: InkWell(
                                            onTap: () async {
                                              await controller.phaseAbilitiesData(controller.pokeMoniModel.results![index].url.toString());
                                              Get.dialog( AbilitiesDialog(abilitiesModel: controller.abilitiesModel,));
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4),
                                              child: Text("Abilities",
                                                style: interMedium.copyWith(
                                                  color: const Color(0xff175CD3),
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          )
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
