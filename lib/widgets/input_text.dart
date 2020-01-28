import 'package:flutter/material.dart';
import 'package:practica_1/vistas/login.dart';

class Input extends StatefulWidget {
  //Input({Key key}) : super(key: key);
  final String label;

  const Input({Key key, @required this.label}) : super(key: key);

  @override
  _Input_text_state createState() => _Input_text_state();
}

class _Input_text_state extends State<Input> {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child:TextFormField(
        style: new TextStyle(color: fromHex('#b3b3b3')),  
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(color: fromHex('#b3b3b3')),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: fromHex('#b3b3b3'),)),
        ),

      )
    );
  }
}