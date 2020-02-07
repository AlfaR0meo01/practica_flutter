import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica_1/widgets/input_text.dart';

//////////////////////////////////////////////
Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

//////////////////////////////////////////////

class RegistrarUser extends StatefulWidget {
  RegistrarUser({Key key}) : super(key: key);

  @override
  _RegistrarUserState createState() => _RegistrarUserState();
}

class _RegistrarUserState extends State<RegistrarUser> {
 

  final nombrecontrolador = TextEditingController();
  final apellidocontrolador = TextEditingController();
  final telefonocontrolador = TextEditingController();
  final emailcontrolador = TextEditingController();
  final pswcontrolador = TextEditingController();

  Future userRegistro() async {
    String nombre = nombrecontrolador.text;
    String apellido = apellidocontrolador.text;
    String telefono = telefonocontrolador.text;
    String email = emailcontrolador.text;
    String psw = pswcontrolador.text;

    String url =
        'https://sistemas.cruzperez.com/calificaciones/flutter/insert_data.php';

    var data = {
      'nombre': nombre,
      'apellido': apellido,
      'telefono': telefono,
      'email': email,
      'psw': psw
    };

    var response = await http.post(Uri.encodeFull(url),
        body: json.encode(data), headers: {'Accept': 'application/json'});

    var msg = jsonDecode(response.body);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(msg),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: new Text('Ok'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro',style: TextStyle(fontSize: 25),),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                width: size.width,
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: 350,
                            maxWidth: 350,
                          ),
                          child: Column(
                            children: <Widget>[
                              Input(
                                  label: 'Nombre', control: nombrecontrolador),
                              Input(
                                  label: 'Apellidos',
                                  control: apellidocontrolador),
                              Input(
                                  label: 'Telefono',
                                  control: telefonocontrolador),
                              Input(label: 'Correo', control: emailcontrolador),
                              Input(
                                  label: 'Contrasena', control: pswcontrolador)
                            ],
                          ),
                        ),
                        SizedBox(
                            height: 50,
                            width: 250,
                            child: new RaisedButton(
                              onPressed: userRegistro,
                              color: fromHex('#1389fd'),
                              child: Text(
                                'Registrar',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
