import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  //Input({Key key}) : super(key: key);
  final String label;

  const Input({Key key, this.label}) : super(key: key);

  @override
  _Input_text_State createState() => _Input_text_State();
}

class _Input_text_State extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: widget.label,   
      ),
    );
  }
}