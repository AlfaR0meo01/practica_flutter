import 'package:flutter/material.dart';





/*class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          color: Colors.cyanAccent[400],
          width: 100.0,
          height: 100.0,
        ),
      ),
    );
  }
}*/

class Cube extends StatefulWidget {
  Cube({Key key}) : super(key: key);

  @override
  _3dcube createState() => _3dcube();
}

class _3dcube extends State<Cube> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          selected = !selected;
        });
      },
      child: Center(
        child: AnimatedContainer(
          width: selected ? 200.0 : 100.0,
          height: selected ? 100.0 : 200.0,
          color: selected ? Colors.red : Colors.blue,
          alignment: selected ?Alignment.center :Alignment.topRight ,
          duration: Duration(milliseconds: 500),
        ),
      ),
    );
  }
}

/*class Submenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.favorite,
          color: Colors.pink,
          size: 24.0,
        ),
        Icon(
          Icons.audiotrack,
          color: Colors.green,
          size: 24.0,
        ),
        Icon(
          Icons.beach_access,
          color: Colors.blue,
          size: 24.0,
        ),
      ],
    );
  }
}*/

