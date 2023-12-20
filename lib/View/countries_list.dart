// import 'package:covid_tracker_app/models/world_countiries_model.dart';
// import 'package:covid_tracker_app/services/utilities/states_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:shimmer/shimmer.dart';

// class CountriesList extends StatefulWidget {
//   const CountriesList({super.key});

//   @override
//   State<CountriesList> createState() => _CountriesListState();
// }

// class _CountriesListState extends State<CountriesList> {
//   //
//   TextEditingController searchController = TextEditingController();
//   StatesServices statesServices = StatesServices();
//   @override
//   Widget build(BuildContext context) {

//  final height = MediaQuery.sizeOf(context).height *1;
// final width = MediaQuery.sizeOf(context).width *1;
//     return  Scaffold(
//       backgroundColor: Colors.amber,
//       appBar: AppBar(
//        title: const Text("Countries List"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           children: [
//             SizedBox(height: height*0.01,),
//             TextFormField(
//               decoration: InputDecoration(
//          hintText: "Search any Country", hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
//                 border: OutlineInputBorder()
//               ),
//               // controller: SearchController(),
//             ),
//             FutureBuilder(
//               future: statesServices.fetchWorldCountriesApi(),
//                builder: ((context, AsyncSnapshot<List<WorldCountriesModel>> snapshot) {
                    
//                 // if(!snapshot.hasData){
                 
//                 //   return const SpinKitChasingDots(color: Colors.red,);

//                  if (snapshot.connectionState == ConnectionState.waiting) {
//       return const SpinKitChasingDots(color: Colors.red);
//     } else if (snapshot.hasError) {
//       return Text('Error: ${snapshot.error}');
//     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//       return const Text('No data available');
//        }
//                    //show shimmer effect
//                   // return ListView.builder(
//                   // itemCount:5, //shimmer effect ki length
//                   // itemBuilder: (context, index){
//                   //   return Shimmer.fromColors(
                      
//                   //     baseColor: Colors.grey.shade700, 
//                   //     highlightColor: Colors.grey.shade200, 
//                   //     child:  Column(
//                   //     children: [
//                   //       ListTile(
//                   //         title: Container(height: 10, width: 80, color: Colors.white12,),
//                   //         subtitle: Container(height: 10, width: 80, color: Colors.white12,),
//                   //         leading: Container(height: 50, width: 50, color: Colors.white12,)
//                   //       )
                        
//                   //     ],
//                   //   ),
//                   //     );
                  
                        
//                   // });
//                   //shimmer
                  
               
//                 else{
//                   return Expanded(
//                     child: ListView.builder(
//                     itemCount:snapshot.data!.length ,
//                     itemBuilder: (context, index){
//                       // var countryData = snapshot.data![index];
//                       return Column(
//                         children: [
//                           ListTile(
//                             title: Text(snapshot.data![index].country.toString()),
//                             subtitle: Text(snapshot.data![index].cases.toString()),
                          
//                             leading: Image(
//                               height: height*0.3 , width: width*0.3,
//                               image: NetworkImage(
//                               snapshot.data![index].countryInfo!.flag.toString(),
//                             )),
//                           )
                          
//                         ],
//                       );
                          
//                     }),
//                   );
                    
//                 }
                 
//                }))
        
//           ],
//         ),
//       ),
      

//     );
//   }
// }