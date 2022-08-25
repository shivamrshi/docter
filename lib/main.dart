import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'loginpage.dart';
void main() //async
 { 
 // WidgetsFlutterBinding.ensureInitialized();
 //n await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
         primarySwatch: Colors.grey,
         fontFamily: GoogleFonts.lato().fontFamily,
      //primaryTextTheme: GoogleFonts.latoTextTheme()
      ),
      
    debugShowCheckedModeBanner: false,
    home: Loginpage(),
    );
  }
}

