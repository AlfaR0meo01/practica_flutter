import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'test_dummy.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = true;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: Test(title: 'Flutter Demo Home Page'),
      home: Login(
        
      ),
      //home: Cube(),
    );
  }
}
