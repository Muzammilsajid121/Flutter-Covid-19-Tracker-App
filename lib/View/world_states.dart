import 'package:covid_tracker_app/View/countrylist.dart';
import 'package:covid_tracker_app/models/world_states_model.dart';
import 'package:covid_tracker_app/services/utilities/reusable_row.dart';
import 'package:covid_tracker_app/services/utilities/states_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';


class WorldStates extends StatefulWidget {
  const WorldStates({super.key});

  @override
  State<WorldStates> createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStates> with TickerProviderStateMixin{
  //ANIMATINON CODE
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this)..repeat();

    //need to dispose this
    @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  //
  final colorList = <Color> [
   const  Color(0xff1599ff),
   const Color(0xff27ff49),
   const Color(0xffff1515)
  ];
  //
  StatesServices statesServices = StatesServices(); // takay api wali screen s data l sakay

  @override
  Widget build(BuildContext context) {
final height = MediaQuery.sizeOf(context).height *1;
final width = MediaQuery.sizeOf(context).width *1;
    return  Scaffold(
      body: Column(
        children: [
           SizedBox(height: MediaQuery.of(context).size.height*0.04,),
           //
           FutureBuilder(
            future: statesServices.fetchWorldStatesApi(), 
            builder: (context, AsyncSnapshot<WorldStatesModel> snapshot){

              if(!snapshot.hasData){
                return  Center(child:  SpinKitFadingCube(
                color: Color.fromARGB(255, 218, 89, 132),
                size: height*0.06,));

              }else{
                return Column(
                  children: [
                    //
                     //
           PieChart(
          chartType: ChartType.ring,
          chartValuesOptions: const ChartValuesOptions(
            showChartValuesInPercentage: true
          ),
          chartRadius:width*0.3,
          legendOptions: const LegendOptions(
            legendPosition: LegendPosition.left ),
            colorList: colorList,
            dataMap:  {
              
               "Total" : double.parse(snapshot.data!.cases.toString()),
               "Recovered" : double.parse(snapshot.data!.recovered.toString()),
              "Deaths": double.parse(snapshot.data!.deaths.toString()),
            },
            animationDuration: const  Duration(milliseconds: 1200),
            ),
            //

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.04, vertical: height*0.02),
              child: Card(
                color: const Color.fromARGB(255, 66, 66, 66),
                child: Column(
                  children: [
                         ReusableRow(title: 'Total', value: snapshot.data!.cases.toString()),
                         ReusableRow(title: 'Recovered', value: snapshot.data!.recovered.toString()),
                         ReusableRow(title: 'Deaths', value: snapshot.data!.deaths.toString()),
                         ReusableRow(title: 'Active Cases', value: snapshot.data!.active.toString()),
                         ReusableRow(title: 'Today Deaths', value: snapshot.data!.todayDeaths.toString()),
                         ReusableRow(title: 'Today Recovered', value: snapshot.data!.todayRecovered.toString()),
                  ],
                ),
              ),
            ),
            //BUTTON
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: height*0.07, width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const  CountriesList2()));
                  }, 
                  child:const  Text("Track countries")),
              ),
            )
                  ],
                );

              }

            }),

        ],
      ),
    );
  }
}
