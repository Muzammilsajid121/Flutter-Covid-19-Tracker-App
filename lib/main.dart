import 'package:covid_tracker_app/View/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19 Tracker',
      theme: ThemeData(
     
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        //
          scaffoldBackgroundColor:Colors.black,
       //
        //TEXT THEMES
        textTheme: TextTheme(
            //Body Small
            bodySmall:
                GoogleFonts.montserrat(fontSize: 11,fontWeight: FontWeight.w600, color: Colors.white),
                //
                displaySmall:
                 GoogleFonts.montserrat(fontSize: 13,fontWeight: FontWeight.w500, color: Colors.white),
            //Body Medium
            bodyMedium: GoogleFonts.montserrat(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
            //
            //Body Large; choosen by theme
            bodyLarge: GoogleFonts.aBeeZee(fontSize: 19,  fontWeight: FontWeight.w700, color: Colors.white),
            // //
            // titleMedium: GoogleFonts.montserrat(fontSize: 31, color: Colors.black , fontWeight: FontWeight.bold),

        ),
          appBarTheme: const  AppBarTheme(
            backgroundColor: Color.fromARGB(255, 44, 62, 92), foregroundColor: Colors.white),
      

        //
      ),
      home: const SplashScreen(),
    );
  }
}

