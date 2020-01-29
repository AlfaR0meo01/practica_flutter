import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
//import 'package:flutter/rendering.dart';
import 'vistas/login.dart';
import 'vistas/registrar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //debugPaintSizeEnabled = true;
    return MaterialApp(
      home: Login(),
      routes: {
        "login":(context)=>Login(),
        "Registrar":(context)=>Registrar(),
      },
    );
  }
}
