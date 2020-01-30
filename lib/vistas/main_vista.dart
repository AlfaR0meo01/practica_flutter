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

class Vista extends StatefulWidget {
  Vista({Key key}) : super(key: key);

  @override
  Main_visa createState() => Main_visa();
}

class Main_visa extends State<Vista> {
  Future<List<User>> _getUser() async {
    var data = await http.get(
        'https://sistemas.cruzperez.com/calificaciones/flutter/get_data.php');
    var jsonData = json.decode(data.body);

    List<User> users = [];
    for (var u in jsonData) {
      User user = User(u['id_usuario'], u['nombre'], u['apellidos'],
          u['telefono'], u['email']);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: fromHex('#2e3740'),
      body: Container(
        child: FutureBuilder(
          future: _getUser(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text("Cargando..."),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index].nombre),
                  );
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
