import 'package:flutter/material.dart';
import 'vistas/login.dart';
import 'vistas/registrar.dart';
import 'vistas/main_vista.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //debugPaintSizeEnabled = true;
    return MaterialApp(
      home: Login(),
      routes: {
        "login":(context)=>Login(),
        "Registrar":(context)=>RegistrarUser(),
        "vista_principal":(context)=>ListViewDatos(),
      },
    );
  }
}
