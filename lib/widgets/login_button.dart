import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final String label;
  final Color color;
  final IconData icon;
  
  const Button({Key key, @required this.label, @required this.color, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 50,
      margin: const EdgeInsets.only(top: 10.0),
       child: RaisedButton.icon(
         onPressed: (){},
         icon: Icon(this.icon, size: 30,),
         label:Text(this.label),  
         color: this.color,
       )
    );
  }
}