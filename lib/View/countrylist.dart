import 'package:covid_tracker_app/View/countries_detail.dart';
import 'package:covid_tracker_app/services/utilities/states_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';


class CountriesList2 extends StatefulWidget {
  const CountriesList2({super.key});

  @override
  State<CountriesList2> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList2> {
  //
  TextEditingController searchController = TextEditingController();
  StatesServices statesServices = StatesServices();
  @override
  Widget build(BuildContext context) {

 final height = MediaQuery.sizeOf(context).height *1;
final width = MediaQuery.sizeOf(context).width *1;
    return  Scaffold(
      // backgroundColor: Colors.pink[100],
      appBar: AppBar(
       title: const Text("Countries List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: height*0.01,),
            //Text Form Field
            TextFormField(
              style:const  TextStyle(color: Colors.white),
              controller: searchController,
              //For search
              onChanged: (value) {
                setState(() {
                });
              },
              //
  decoration: InputDecoration(
  hintText: "Search any Country",
   hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),

  
                border: const  OutlineInputBorder()
              ),
              
            ),
            FutureBuilder(
              future: statesServices.fetchWorldCountriesApi(),
               builder: ((context, AsyncSnapshot<List<dynamic>> snapshot) {
                  
                  //  if(!snapshot.hasData){   
                  //   // show shimmer effect
                  // return ListView.builder(
                  // itemCount:3, //shimmer effect ki length
                  // itemBuilder: (context, index){
                  //   return Shimmer.fromColors(
                      
                  //     baseColor: Colors.grey.shade700, 
                  //     highlightColor: Colors.grey.shade200, 
                  //     child:  Column(
                  //     children: [
                  //       ListTile(
                  //         title: Container(height: 10, width: 80, color: Colors.white,),
                  //         subtitle: Container(height: 10, width: 80, color: Colors.white,),
                  //         leading: Container(height: 50, width: 50, color: Colors.white,)
                  //       )
                        
                  //     ],
                  //   ),
                  //     );
                  
                        
                  // });}
//                   //shimmer
                    
                if(!snapshot.hasData){   
                  return const SpinKitChasingDots(color: Colors.red,);
                }
     
                else{
                  return Expanded(
                    child: ListView.builder(
                    itemCount:snapshot.data!.length ,
                    itemBuilder: (context, index){


                      // Search Country Name
                      String name = snapshot.data![index]['country'];
                     // Agar empty to sab dikhadoo
                      if(searchController.text.isEmpty){
                         return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              //
                                 Navigator.push(context, MaterialPageRoute(
                                builder: (context)=>  CountryDetailScreen(
                                  // Country deatail screen k parameter doo required
                                  name: snapshot.data![index]['country'],
                                  image: snapshot.data![index]['countryInfo']['flag'],
                                  totalCases:snapshot.data![index]['cases'] ,
                                  active: snapshot.data![index]['active'],
                                  critical:snapshot.data![index]['critical'],
                                  deaths:snapshot.data![index]['deaths'],
                                  todayDeaths:snapshot.data![index]['todayDeaths'],
                                  todayRecovered: snapshot.data![index]['todayRecovered'],
                                )));
                              
                            },
                            child: ListTile(
                            title: Text(snapshot.data![index]['country']),
                              titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                              subtitle: Text(snapshot.data![index]['cases'].toString(),),
                              subtitleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white), 
                            
                              leading: Image(
                                height: height*0.09 , width: width*0.09,
                                image: NetworkImage(
                                snapshot.data![index]['countryInfo']['flag'],
                              )),
                            ),
                          )
                          
                        ],
                      );

                      }else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                            return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              //
                                 Navigator.push(context, MaterialPageRoute(
                                builder: (context)=>  CountryDetailScreen(
                                  // Country deatail screen k parameter doo required
                                  name: snapshot.data![index]['country'],
                                  image: snapshot.data![index]['countryInfo']['flag'],
                                  totalCases:snapshot.data![index]['cases'] ,
                                  active: snapshot.data![index]['active'],
                                  critical:snapshot.data![index]['critical'],
                                  deaths:snapshot.data![index]['deaths'],
                                  todayDeaths:snapshot.data![index]['todayDeaths'],
                                  todayRecovered: snapshot.data![index]['todayRecovered'],
                                )));
                            },
                            child: ListTile(
                              title: Text(snapshot.data![index]['country']),
                              titleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                              subtitle: Text(snapshot.data![index]['cases'].toString(),),
                              subtitleTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white), 
                             
                            
                              leading: Image(
                                height: height*0.09 , width: width*0.09,
                                image: NetworkImage(
                                snapshot.data![index]['countryInfo']['flag'] ,
                              )),
                            ),
                          )
                          
                        ],
                      );

                      }else{
                        return Container();
                      }
  
                    }),
                  );
                    
                }
                 
               }))
        
          ],
        ),
      ),
      

    );
  }
}