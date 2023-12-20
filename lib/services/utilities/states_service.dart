import 'dart:convert';

import 'package:covid_tracker_app/models/world_states_model.dart';
import 'package:covid_tracker_app/services/app_urls.dart';
import 'package:http/browser_client.dart' as http;


class StatesServices{
  //
  Future<WorldStatesModel> fetchWorldStatesApi()async{
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    var data = jsonDecode(response.body.toString());

      if(response.statusCode==200){
        return WorldStatesModel.fromJson(data);
      }else{
        // return WorldStatesModel.fromJson(data);
        throw Exception();
        
      }
    }

}