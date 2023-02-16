import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_app/config.dart';
import 'package:task_app/core/help_me.dart';
import 'package:task_app/data/model/abilities_model.dart';
import 'package:task_app/data/model/poke_moni_model.dart';

class Repository {
  Future getPokeMoni() async {
    var url = Uri.parse(
        "${Config.apiUrl}pokemon");
    try {
      final response = await http.get(url);
      var data = json.decode(response.body.toString());
      PokeMoniModel pokeMoniModel = PokeMoniModel.fromJson(data);
      printLog(pokeMoniModel.results![0].url.toString());
      return pokeMoniModel;
    } catch(e) {
      return e;
    }
  }
  Future getAbilities(String url) async {
    var baseUrl = Uri.parse(url);
    try {
      final response = await http.get(baseUrl);
      var data = json.decode(response.body.toString());
      AbilitiesModel pokeMoniModel = AbilitiesModel.fromJson(data);
      return pokeMoniModel;
    } catch(e) {
      return e;
    }
  }
}