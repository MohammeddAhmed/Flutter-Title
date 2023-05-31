import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  //final String message = 'Provider Message';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MessageProvider>(
      create: (context) => MessageProvider(),
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
      Provider.of<MessageProvider>(context, listen: true).message,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 18,
        color: Colors.white,
      ),
    );
  }
}

class ScaffoldBody extends StatelessWidget {
  const ScaffoldBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AppText(),
        AppTextFiled(),
      ],
    );
  }
}

class AppText extends StatelessWidget {
  const AppText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        Provider.of<MessageProvider>(context, listen: true).message,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}

class AppTextFiled extends StatelessWidget {
  const AppTextFiled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: TextField(
        onChanged: (String value) {
          Provider.of<MessageProvider>(context, listen: false).changeMessage(value);
        },
      ),
    );
  }
}

class MessageProvider extends ChangeNotifier {
  String message = 'Provider Message';

  void changeMessage(String message) {
    this.message = message;
    notifyListeners();
  }
}
