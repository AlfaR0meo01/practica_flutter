import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

class ListViewDatos extends StatefulWidget {
  ListViewDatos({Key key}) : super(key: key);
  @override
  _ListViewDatosState createState() => _ListViewDatosState();
}

class _ListViewDatosState extends State<ListViewDatos> {
  List dataUsers = [];


  void readData() async {
    var data = await http.get(
        'https://sistemas.cruzperez.com/calificaciones/flutter/get_data.php');
    List<dynamic> jsonDecoded = await jsonDecode(data.body);
    var internalDataUsers = [];
    jsonDecoded.forEach((dat) => internalDataUsers.add(Users.fromJson(dat)));
    setState(() {
      dataUsers = internalDataUsers;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (dataUsers.isEmpty) readData();
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          dataUsers.isEmpty
              ? Text('cargando')
              : ListView(
                  children: dataUsers
                      .map((user) => Text(user.nombre))
                      .toList(),
                ),
          Positioned(
            bottom: 0,
            child: FlatButton(
              child: Text('Reload'),
              onPressed: () => readData(),
            ),
          ),
        ],
      ),
    );
  }
}

class Users {
  final idUsuario;
  final nombre;
  final apellidos;
  final telefono;
  final email;
  final psw;

  factory Users.fromJson(Map<String, dynamic> parsedJson) {
    return Users(
        parsedJson['id_usuario'],
        parsedJson['nombre'],
        parsedJson['apellidos'],
        parsedJson['telefono'],
        parsedJson['email'],
        parsedJson['psw']);
  }

  Users(this.idUsuario, this.nombre, this.apellidos, this.telefono, this.email,
      this.psw);
}