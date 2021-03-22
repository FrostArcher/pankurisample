import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pankhuri_sample_app/sample_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Montserrat",
        primaryColor: Color(0xFF7624d3),
        accentColor: Color(0xfff1ebf8),
      ),
      home: SamplePage(),
    );
  }
}
