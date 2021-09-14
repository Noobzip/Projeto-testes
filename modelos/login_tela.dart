import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TelaTeste extends StatefulWidget {
  const TelaTeste({Key? key}) : super(key: key);

  @override
  _TelaTesteState createState() => _TelaTesteState();
}

class _TelaTesteState extends State<TelaTeste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                //E-mail Login----------------------------------------------------
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'E-mail',
                  labelStyle: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w400,
                      fontSize:
                          20 //adicionar a possibilidade de esse valor ser mutavel pelo usuario
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
