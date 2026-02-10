
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
@RoutePage()
class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Deep Linking Demo")),);
  }

}