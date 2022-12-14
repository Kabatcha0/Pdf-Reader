import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pdfreader/blocobserver.dart';
import 'package:pdfreader/modules/pdfreader.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PdfReader(),
    );
  }
}
