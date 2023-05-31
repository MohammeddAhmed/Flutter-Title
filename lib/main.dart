import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key,}) : super(key: key);

  final String message = 'Message Content';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(message: message),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key,required this.message}) : super(key: key);

  final String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(message: message),
      ),
      body: ScaffoldBody(message: message),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key,required this.message}) : super(key: key);

  final String message;
  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 18,
      color: Colors.white,
    ),);
  }
}

class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({Key? key,required this.message}) : super(key: key);

  final String message;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(message: message,),
      ],
    );
  }
}

class AppText extends StatelessWidget {
  const AppText({Key? key,required this.message}) : super(key: key);

  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: Colors.black,
        ),),
    );
  }
}




