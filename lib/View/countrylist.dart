
import 'package:covid_tracker_app/services/utilities/states_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


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
      backgroundColor: Colors.amber,
      appBar: AppBar(
       title: const Text("Countries List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: height*0.01,),
            TextFormField(
              decoration: InputDecoration(
         hintText: "Search any Country", hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
                border: OutlineInputBorder()
              ),
              // controller: SearchController(),
            ),
            FutureBuilder(
              future: statesServices.fetchWorldCountriesApi(),
               builder: ((context, AsyncSnapshot<List<dynamic>> snapshot) {
                    
                // if(!snapshot.hasData){
                 
                //   return const SpinKitChasingDots(color: Colors.red,);

                 if (snapshot.connectionState == ConnectionState.waiting) {
      return const SpinKitChasingDots(color: Colors.red);
    } else if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return const Text('No data available');
       }
                 
                  
               
                else{
                  return Expanded(
                    child: ListView.builder(
                    itemCount:snapshot.data!.length ,
                    itemBuilder: (context, index){
                      // var countryData = snapshot.data![index];
                      return Column(
                        children: [
                          ListTile(
                            title: Text(snapshot.data![index]['country']),
                            subtitle: Text(snapshot.data![index]['cases'].toString()),
                          
                            leading: Image(
                              height: height*0.09 , width: width*0.09,
                              image: NetworkImage(
                              snapshot.data![index]['countryInfo']['flag'],
                            )),
                          )
                          
                        ],
                      );
                          
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