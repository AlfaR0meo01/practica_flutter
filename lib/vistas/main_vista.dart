import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
/*class Vista extends StatefulWidget {
  Vista({Key key}) : super(key: key);

  @override
  _VistaState createState() => _VistaState();
}

class _VistaState extends State<Vista> {

  List data;

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("https://sistemas.cruzperez.com/calificaciones/flutter/get_data.php"),
      headers: {
        "Accept": "application/json"
      }
    );

    this.setState(() {
      data = json.decode(response.body);
    });
    print(data[1]["nombre"]);
    
    return "Success!";
  }

   @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('lista'),
      ),
      backgroundColor:fromHex('#2e3740') ,
      body: new ListView.builder(
          itemCount: data == null ? 0 :data.length,
          itemBuilder: (BuildContext context , int index){
            return new Card(
              child: new Text(data[index].nombre) ,
            );
          },
      ),
    );
  }
}

class Vista extends StatefulWidget {
  Vista({Key key}) : super(key: key);

  @override
  Main_visa createState() => Main_visa();
}

class Main_visa extends State<Vista> {


  Future<List<User>> _getUser() async {
    var data = await http.get('https://sistemas.cruzperez.com/calificaciones/flutter/get_data.php');
    
    var jsonData = json.decode(data.body);
    //print(jsonData);
    //print(jsonData[2]['apellidos']);
    //jsonData.json();
    List<User> users = [];
    jsonData.forEach((u)=> users.add(User(u['id_usuario'],u['nombre'], u['apellidos'], u['telefono'], u['email'])));
     
    /*for (var u in jsonData) {
      User user = User(u['id_usuario'],u['nombre'], u['apellidos'], u['telefono'], u['email']);
    }*/
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fromHex('#2e3740'),
      body: Container(
        child: FutureBuilder(
          future: _getUser(),
          builder: (BuildContext context,AsyncSnapshot snapshot) {
            if(snapshot.data == null ){
              return Container(
                child: Center(
                  child: Text("Cargando..."),
                ),
              );
            }else{
              return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(snapshot.data[index].nombre),
              ) ;
             },
            );
            }
          },
        ),
      ),
    );
  }
}

class User {
  final int id_usuario;
  final String nombre;
  final String apellidos;
  final int telefono;
  final String email;

  User(this.id_usuario, this.nombre, this.apellidos, this.telefono, this.email);
}
*/

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
    jsonDecoded.forEach((dat) => internalDataUsers.add(Felipe.fromJson(dat)));
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
                      .map((felipito) => Text(felipito.nombre))
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

class Felipe {
  final idUsuario;
  final nombre;
  final apellidos;
  final telefono;
  final email;
  final psw;

  factory Felipe.fromJson(Map<String, dynamic> parsedJson) {
    return Felipe(
        parsedJson['id_usuario'],
        parsedJson['nombre'],
        parsedJson['apellidos'],
        parsedJson['telefono'],
        parsedJson['email'],
        parsedJson['psw']);
  }

  Felipe(this.idUsuario, this.nombre, this.apellidos, this.telefono, this.email,
      this.psw);
}