
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
@RoutePage()
class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Deep Linking Demo")),      body: Center(
      child: ElevatedButton(
        onPressed: () {
          Share.share(
              'https://sudipeb.github.io/deeplinking/profile',
              subject: 'Awesome App!'
          );
        },
        child: Text('Share App'),
      ),),);
  }

}