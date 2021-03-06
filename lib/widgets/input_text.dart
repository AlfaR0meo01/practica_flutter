import 'package:flutter/material.dart';
import 'package:practica_1/vistas/login.dart';

class Input extends StatefulWidget {
  
  final String label;
  final TextEditingController control;
  //final String control;

  const Input({Key key, @required this.label, this.control}) : super(key: key);

  @override
  Input_Text_State createState() => Input_Text_State();
}

class Input_Text_State extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child:TextFormField(
        controller: widget.control,
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