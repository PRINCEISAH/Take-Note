import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:todo/HomePage/HomeScreen.dart';

class Splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      title: Text(
        "Zoe Diary",
        style: GoogleFonts.poppins(
            fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      navigateAfterSeconds: HomeScreen(),
      backgroundColor: Colors.pink,
      loaderColor: Colors.white,
    );
  }
}
