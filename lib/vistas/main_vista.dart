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
  Future<List<Users>> readData() async {
    var data = await http.get(
        'https://sistemas.cruzperez.com/calificaciones/flutter/get_data.php');

    var jsonData = jsonDecode(data.body);

    List<Users> users = [];

    for (var u in jsonData) {
      Users user = Users(u['id_usuario'], u['nombre'], u['apellidos'],
          u['telefon'], u['email'], u['psw']);
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => readData(),
          )
        ],
      ),
      body: Container(
        child: FutureBuilder(
            future: readData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text('cargando'),
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          leading: Icon(Icons.account_circle),
                          title: Text(snapshot.data[index].nombre),
                          subtitle: Text(snapshot.data[index].email));
                    });
              }
            }),
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

  Users(this.idUsuario, this.nombre, this.apellidos, this.telefono, this.email,
      this.psw);
}
