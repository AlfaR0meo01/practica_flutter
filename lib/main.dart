import 'package:flutter/material.dart';
import 'vistas/login.dart';
import 'vistas/registrar.dart';
import 'vistas/main_vista.dart';
import 'vistas/send_data.dart';

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
        "vista_principal":(context)=>ListViewDatos(),
      },
    );
  }
}
