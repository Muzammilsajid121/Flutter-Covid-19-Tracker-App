import 'package:covid_tracker_app/View/world_states.dart';
import 'package:covid_tracker_app/services/utilities/reusable_row.dart';
import 'package:flutter/material.dart';

class CountryDetailScreen extends StatelessWidget {
  final String name, image;
  final int totalCases, todayDeaths, todayRecovered, active, critical, deaths;
   CountryDetailScreen({
    required this.name,
    required this.active,
    required this.critical,
    required  this.deaths,
    required  this.image,
    required  this.totalCases,
    required  this.todayDeaths,
    required  this.todayRecovered});

  @override
  Widget build(BuildContext context) {
final height = MediaQuery.of(context).size.height * 1;
final width = MediaQuery.of(context).size.width * 1;

    return  Scaffold(
      appBar: AppBar(
        title:Text( name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                  Padding(
                    padding:  EdgeInsets.only(
                      top:MediaQuery.of(context).size.height*0.04),
                    child: Card(
                                color: Color.fromARGB(255, 36, 35, 35),
                                child: Column(
                                  children: [
                    ReusableRow(title: 'Name', value: name.toString()),
                     ReusableRow(title: 'Active Cases', value: active.toString()),
                      ReusableRow(title: 'Total Cases', value: totalCases.toString()),
                       ReusableRow(title: 'Critical', value: totalCases.toString()),
                        ReusableRow(title: 'Deaths', value: deaths.toString()),
                         ReusableRow(title: 'Today Deaths', value: todayDeaths.toString()),
                          ReusableRow(title: 'Today Recovered', value: todayRecovered.toString()),
                         
                                  ],
                                ),
                              ),
                  ),
            CircleAvatar(backgroundImage: NetworkImage(image),
            radius: 40 )
        
              ],
            )
          
            
        
          ],
        ),
      ),

    );
  }
}