import 'dart:developer';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:task_app/core/help_me.dart';
import 'package:task_app/data/model/abilities_model.dart';
import 'package:task_app/data/model/poke_moni_model.dart';
import 'package:task_app/repository/repository.dart';

class HomeController extends GetxController{

  bool isStatus = true;
  bool isPlaying = false;
  bool isLoading = false;
  bool isVolume = true;

  PokeMoniModel pokeMoniModel = PokeMoniModel();
  AbilitiesModel abilitiesModel = AbilitiesModel();

  @override
  void onInit() {
    phaseData();
    super.onInit();
  }


  Future phaseData() async{
    await Repository().getPokeMoni().then((value){
      pokeMoniModel = value;
    });
   update();
  }

  Future phaseAbilitiesData(String url) async{
    printLog("-----$url");
    abilitiesModel = await Repository().getAbilities(url);
   update();
  }


}