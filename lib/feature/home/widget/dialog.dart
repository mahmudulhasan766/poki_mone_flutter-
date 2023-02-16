import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_app/data/model/abilities_model.dart';
import 'package:task_app/utils/dimensions.dart';
import 'package:task_app/utils/images.dart';
import 'package:task_app/utils/styles.dart';


class AbilitiesDialog extends StatelessWidget {
  final AbilitiesModel abilitiesModel;
  const AbilitiesDialog({Key? key,required this.abilitiesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault),
                child: Text("Abilities",
                  style: interSemiBold.copyWith(
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                      fontSize: Dimensions.fontSizeLarge
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(Images.cancel),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.0),
          child: Divider(color: Color(0xffEAECF0), thickness: 1),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeLarge),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: abilitiesModel.abilities!.length,
              itemBuilder: (context,index){
               return Padding(
                 padding: const EdgeInsets.symmetric(vertical: 5.0),
                 child: Row(
                   children: [
                      Text("${index+1}. ",
                          style: interRegular.copyWith(
                            color: const Color(0xff595959),
                            fontSize: 14,
                          )
                      ),
                     Text(abilitiesModel.abilities![index].ability!.name.toString(),
                         style: interRegular.copyWith(
                           color: const Color(0xff595959),
                           fontSize: 14,
                         )
                     ),
                   ],
                 ),
               );
              },
          ),
        ),
      ],
    );
  }
}
