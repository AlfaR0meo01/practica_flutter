//import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica_1/widgets/input_text.dart';
import 'package:practica_1/widgets/login_button.dart';

/************************************* */
Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

/************************************** */
class Registrar extends StatefulWidget {
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
                              padding: EdgeInsets.only(left: 20.0),
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
                left: 10,
                top: 75,
                child: FloatingActionButton(
                  backgroundColor: fromHex('#3DA35D'),
                  onPressed: () => Navigator.pushNamed(context, "login"),
                  child: Icon(
                    Icons.arrow_back,
                    color: fromHex('#b3b3b3'),
                    size: 30,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
