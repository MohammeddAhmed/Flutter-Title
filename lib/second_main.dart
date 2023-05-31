import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp(),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key,}) : super(key: key);

  final String message = 'Provider Message';

  @override
  Widget build(BuildContext context) {
    return Provider<String>(
      create: (context) => message,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(),
      ),
      body: const ScaffoldBody(),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      Provider.of(context,listen: true),
      style: GoogleFonts.poppins(
      fontWeight: FontWeight.w400,
      fontSize: 18,
      color: Colors.white,
    ),);
  }
}

class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //TODO: For Example For MultiProviders ..
    return MultiProvider(
      providers: [
        Provider<double>(create: (context) => 3.14,),
        Provider<int>(create: (context) => 99,),
        Provider<bool>(create: (context) => true,),
      ],
      child: Column(
        children: const[
          AppText(),
        ],
      ),
    );
  }
}

class AppText extends StatelessWidget {
  const AppText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        Provider.of<String>(context,listen: true),
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: Colors.black,
        ),),
    );
  }
}




