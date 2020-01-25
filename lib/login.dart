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
      backgroundColor: Colors.grey[300],
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
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: 350,
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
                            SizedBox(
                              height: 50,
                            ),
                            Column(
                              children: <Widget>[
                                Button(
                                  label: 'Inicir Session',
                                  color: Colors.pinkAccent,
                                ),
                                Button(
                                  icon: Icons.account_circle,
                                  label: 'Google',
                                  color: Colors.white,
                                ),
                                Button(
                                  icon: Icons.account_circle,
                                  label: 'Facebook',
                                  color: fromHex('#4267b2'),
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
