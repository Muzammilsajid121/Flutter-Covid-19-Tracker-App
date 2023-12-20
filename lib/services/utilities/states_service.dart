import 'dart:convert';
import 'package:covid_tracker_app/models/world_countiries_model.dart';
import 'package:covid_tracker_app/models/world_states_model.dart';
import 'package:covid_tracker_app/services/app_urls.dart';

import 'package:http/http.dart' as http;


class StatesServices{
  //
  Future<WorldStatesModel> fetchWorldStatesApi()async{
   
     final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

      if(response.statusCode==200){
        var data = jsonDecode(response.body.toString());
        return WorldStatesModel.fromJson(data);
      }else{
        // return WorldStatesModel.fromJson(data);
        throw Exception();
        
      }
    }

    //FOR COUNTRIES

    //   Future<List<dynamic>> fetchWorldCountriesApi()async{
   
    //  final response = await http.get(Uri.parse(AppUrl.countriesList));

    //   if(response.statusCode==200){
    //     var data = jsonDecode(response.body);
    //     print(data);
    //     return data;
    //   }else{
        
    //     throw Exception('Error');
        
    //   }
    // }

    Future<List<WorldCountriesModel>> fetchWorldCountriesApi() async {
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<WorldCountriesModel> countries = data
          .map((json) => WorldCountriesModel.fromJson(json))
          .toList(); // Convert each JSON item to WorldCountry
      return countries;
    } else {
      throw Exception('Error');
    }
  }

}