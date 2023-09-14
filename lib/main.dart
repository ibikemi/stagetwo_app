import 'package:flutter/material.dart';
import 'package:stagetwo_app/viewcv.dart';
import 'package:stagetwo_app/sharedpreference.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Required before using SharedPreferences
  await SharedPreferencesHelper.init();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('View Resume')),
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const ViewCV()),
      ),
    ),
  );
}
