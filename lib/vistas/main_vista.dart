import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sweet_alert_dialogs/sweet_alert_dialogs.dart';
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
  List data_users = [];

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

    setState(() {
      data_users = users;
    });
    return users;
  }

  @override
  Widget build(BuildContext context) {
    if (data_users.isEmpty) readData();
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
        child: Stack(
          children: <Widget>[
            data_users.isEmpty
                ? Text('cargando')
                : ListView.builder(
                    itemCount: data_users.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key('${data_users[index]}'),
                        child: InkWell(
                          onTap: () {
                            print('${data_users[index]} clicked');
                          },
                          child: ListTile(
                            leading: Icon(Icons.account_circle, size: 50),
                            title: Text('${data_users[index].nombre}'),
                            subtitle: Text('${data_users[index].email}'),
                          ),
                        ),
                        background: slideRight(),
                        secondaryBackground: slideLeft(),
                        confirmDismiss: (direccion) async {
                          if (direccion == DismissDirection.endToStart) {
                            final bool res = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SweetAlert.show(
                                  content: Text(
                                      'Estas seguro de eliminar el usuario ${data_users[index].nombre} ?'),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text(
                                        'Cancelar',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    FlatButton(
                                      child: Text(
                                        'Eliminar',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          data_users.removeAt(index);
                                        });
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              },
                            );
                            return res;
                          } else {
                            //redirecciona a la pagina de editar
                            RaisedButton(onPressed: () {});
                          }
                        },
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

Widget slideRight() {
  return Container(
    color: Colors.green,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.edit,
            color: Colors.white,
          ),
          Text(
            " Editar",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
    ),
  );
}

Widget slideLeft() {
  return Container(
    color: Colors.red,
    child: Align(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          Text(
            " Eliminar",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      alignment: Alignment.centerRight,
    ),
  );
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
