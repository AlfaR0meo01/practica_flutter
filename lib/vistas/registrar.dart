import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica_1/widgets/input_text.dart';
import 'package:practica_1/widgets/login_button.dart';

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
  bool visible = false;

  final nombrecontrolador = TextEditingController();
  final apellidocontrolador = TextEditingController();
  final telefonocontrolador = TextEditingController();
  final emailcontrolador = TextEditingController();
  final pswcontrolador = TextEditingController();

  Future userRegistro() async {
    setState(() {
      visible = true;
    });

    String nombre = nombrecontrolador.text;
    String apellido = apellidocontrolador.text;
    String telefono = telefonocontrolador.text;
    String email = emailcontrolador.text;
    String psw = pswcontrolador.text;

    var url =
        'https://sistemas.cruzperez.com/calificaciones/flutter/insert_data.php';

    var data = {
      'nombre': nombre,
      'apellido': apellido,
      'telefono': telefono,
      'email': email,
      'psw': psw
    };

    var response = await http.post(url, body: json.encode(data));

    var msg = jsonDecode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }

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
      backgroundColor: fromHex('#2e3740'),
      body: Container(
        width: size.width,
        height: size.height,
        child: Center(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
            ),
            Input(
              _controller
              label: 'nombre'
              )

          ],
        )),
      ),
    );
  }
}

/*class Registrar extends StatefulWidget {
  Registrar({Key key}) : super(key: key);

  @override
  _Loginpage createState() => _Loginpage();
}

class _Loginpage extends State<Registrar> {



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //Orientation currentOrientation = MediaQuery.of(context).orientation;

    return Scaffold(
      backgroundColor: fromHex('#2e3740'),
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                  width: size.width,
                  height: size.height,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              height: 60,
                              margin: EdgeInsets.only(bottom: 50.0),
                              padding: EdgeInsets.only(left: 50.0),
                              color: fromHex('#1fcd6c'),
                              child: Row(
                                children: <Widget>[
                                  Text('Registro',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30)),
                                ],
                              ),
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: 380,
                                maxWidth: 350,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Input(
                                    label: 'Nombre',
                                  ),
                                  Input(
                                    label: 'Apellidos',
                                  ),
                                  Input(
                                    label: 'Telefono',
                                  ),
                                  Input(
                                    label: 'Correo',
                                  ),
                                  Input(
                                    label: 'Constraseña',
                                  ),
                                  Input(
                                    label: 'Constraseña',
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Column(
                              children: <Widget>[
                                Button(
                                  label: 'Registrar',
                                  color: fromHex('#1fcd6c'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
            Positioned(
                top: 29,
                child: CupertinoButton(
                  onPressed: () => Navigator.pushNamed(context, "login"),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
var dat = await http.post('https://sistemas.cruzperez.com/calificaciones/flutter/get_data.php',body: {
      'dat1':12
    }); */
