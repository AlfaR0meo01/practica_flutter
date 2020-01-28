import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'vistas/login.dart';
import 'vistas/registrar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //debugPaintSizeEnabled = true;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: Test(title: 'Flutter Demo Home Page'),
      home: Login(),
      routes: {
        "login":(context)=>Login(),
        "Registrar":(context)=>Registrar(),
      },
      //home: Cube(),
    );
  }
}
