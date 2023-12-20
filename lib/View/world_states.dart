import 'package:covid_tracker_app/View/countries_list.dart';
import 'package:covid_tracker_app/models/world_states_model.dart';
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


  // //API CODE
  // Future<WorldStatesModel> fetchWorldStatesApi() async{
  //   final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

  //   var data = jsonDecode(response.body.toString());

  //     if(response.statusCode==200){
        
  //       return WorldStatesModel.fromJson(data);
  //     }else{
  //       // return WorldStatesModel.fromJson(data);
  //       throw Exception();
        
  //     }
  //   }



  //
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
                return const  SpinKitChasingDots(color: Colors.red,);

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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const  CountriesList()));
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

class ReusableRow extends StatelessWidget {
  final String title, value;
   ReusableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: EdgeInsets.all(12),
      child: Column(
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Text(value),
          ],
        )
      ]),

    );
  }
}