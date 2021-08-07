import 'package:dsc_mobile_track4/task2.dart';
import 'package:dsc_mobile_track4/task_mahmoud/provider.dart';
import 'package:dsc_mobile_track4/task_mahmoud/screens/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(_)=> TaskProvider(),

      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          // primaryColor: Colors.yellowAccent,
// accentColor: Colors.yellowAccent
        ),
        home:LayoutScreen(),
      ),
    );
  }
}


