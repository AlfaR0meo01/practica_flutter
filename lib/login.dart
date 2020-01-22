import 'package:flutter/material.dart';
import 'package:practica_1/widgets/circle.dart';
import 'package:flutter/cupertino.dart';

class Login extends StatefulWidget {
   Login({Key key}) : super(key: key);

  @override
  _Loginpage createState() => _Loginpage();
}

class _Loginpage extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      
       body: Container(
         width: size.width,
         height: size.width,
         child: Stack(
           children: <Widget>[
              Positioned(
               right: -size.width *0.22,
               top: -size.width *0.36,
               child: Circle(
                 radius: size.width *0.45,
                 colors: [
                   Colors.pink,
                   Colors.pinkAccent
                 ],
               ),
             ),
              Positioned(
               left: -size.width *0.15,
               top: -size.width *0.34,
               child: Circle(
                 radius: size.width *0.35,
                 colors: [
                   Colors.orange,
                   Colors.deepOrange
                 ],
               ),
             ),
              SingleChildScrollView(
                child: SafeArea(
                  child: Container(
                  width: size.width,
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            child: Icon(
                              Icons.account_circle,
                              color:Colors.grey[350],
                              size: 90,
                            ),
                            width: 90,
                            height: 90,
                            margin: EdgeInsets.only(top: size.width * .5),
                            decoration: BoxDecoration(
                              color:Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 25
                                )
                              ]
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Bienvenidos',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300
                            ),
                            )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: 300,
                              maxWidth: 300,
                            ),
                            child: CupertinoButton(
                              padding: EdgeInsets.symmetric(vertical: 17 ),
                              color: Colors.pinkAccent,
                              onPressed: (){},
                              child: Text(
                                'Iniciar Session',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
               ),
             )
           ],
         ),
       ),
    );
  }
}
   /*SingleChildScrollView(
               child: SafeArea(
                 child: Container(
                 width: size.width,
                 height: size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                     Column(
                       children: <Widget>[
                          Container(
                            child: Icon(
                              Icons.account_circle,
                              color:Colors.grey[350],
                              size: 90,
                            ),
                          width: 90,
                          height: 90,
                          margin: EdgeInsets.only(top: size.width * 0.4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,blurRadius: 10
                              )
                            ]
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Bienvenido',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300
                            ),
                          ),
                        Column(
                          children: <Widget>[
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 350,
                                maxHeight: 350
                              ),
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.symmetric(vertical: 17 ),
                              color: Colors.pink,
                              onPressed: (){},
                              child: Text('Iniciar Session'),
                            )
                          ],
                        )
                       ],
                     )
                    ],
                  ),
                ),
               ),
             )*/