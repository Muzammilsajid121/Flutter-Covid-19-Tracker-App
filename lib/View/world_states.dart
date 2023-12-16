import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
final height = MediaQuery.sizeOf(context).height *1;
final width = MediaQuery.sizeOf(context).width *1;
    return  Scaffold(
      body: Column(
        children: [
           SizedBox(height: MediaQuery.of(context).size.height*0.04,),
           PieChart(
          chartType: ChartType.ring,
          chartRadius:width*0.3,
          legendOptions: const LegendOptions(
            legendPosition: LegendPosition.left ),
            colorList: colorList,
            dataMap: const {
              "Total" :20, 
              "Recovered" : 50,
              "Deaths": 5
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
                         ReusableRow(title: 'Total', value: '20',),
                         ReusableRow(title: 'Recovered', value: '30'),
                         ReusableRow(title: 'Deaths', value: '40')
                  ],
                ),
              ),
            ),
            //BUTTON
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 50, width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white
                  ),
                  onPressed: (){}, 
                  child: Text("Track countries")),
              ),
            )
            
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