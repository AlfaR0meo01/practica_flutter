import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:practica_1/widgets/input_text.dart';
import 'package:practica_1/widgets/login_button.dart';

///////////////////////////////////////////
Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

/////////////////////////////////////////////
class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _Loginpage createState() => _Loginpage();
}

class _Loginpage extends State<Login> {
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
                              margin: EdgeInsets.only(top: 100),
                            ),
                            Icon(
                              Icons.account_circle,
                              color: fromHex('#b3b3b3'),
                              size: 90,
                            ),
                            Container(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight: 150,
                                  maxWidth: 350,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Input(
                                      label: 'Correo',
                                    ),
                                    Input(
                                      label: 'Constraseña',
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Button(
                                  label: 'Iniciar Sesion',
                                  color: fromHex('#1fcd6c'),
                                ),
                                Button(
                                  icon: FontAwesomeIcons.google,
                                  label: 'Google',
                                  color: Colors.white,
                                ),
                                Button(
                                  icon: FontAwesomeIcons.facebookF,
                                  label: 'Facebook',
                                  color: fromHex('#4267b2'),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Todavia no tienes cuenta',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                    CupertinoButton(
                                      onPressed: () => Navigator.pushNamed(
                                          context, "Registrar"),
                                      child: Text(
                                        'Registrate',
                                        style: TextStyle(
                                            color: fromHex('#1fcd6c')),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
