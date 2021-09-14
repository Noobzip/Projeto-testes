import 'package:flutter/material.dart';
//import 'package:ifeira_app_1/modelos/register_page.dart';

class TelaLogin extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: Container(
          padding: EdgeInsets.only(
            top: 60,
            left: 40,
            right: 40,
          ),
          color: Colors.white70,
          child: ListView(
            children: <Widget>[
              SizedBox(
                width: 230,
                height: 230,
                child: Image.asset("assets/image/logo.png"),
              ),
              TextFormField(
                //E-mail Login----------------------------------------------------
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                    labelStyle: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w400,
                        fontSize: 20
                        //adicionar a possibilidade de esse valor ser mutavel pelo usuario
                        ),
                    prefixIcon: Icon(Icons.email_outlined)),
                style: TextStyle(fontSize: 20),
              ),
              Padding(
                //Senha Login----------------------------------------------------
                padding: EdgeInsets.only(top: 20),
                child: TextFormField(
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
                      prefixIcon: Icon(Icons.vpn_key_outlined),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined)),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                height: 25,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.black54,
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  _formKey.currentState?.validate();
                },
                child: Text(
                  "LOGIN",
                  textScaleFactor: 1.5,
                ),
              ),
              Container(
                //Botão----------------------------------------------------
                height: 70,
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text(
                    "Não possui conta? Cadastre-se já",
                    textAlign: TextAlign.right,
                  ),
                  onPressed: () {
                    /* Navigator.push(
                        context,
                       MaterialPageRoute(
                            builder: (BuildContext context) => TelaCadastro()));*/
                  },
                ),
              ),
            ],
          )),
    );
  }
}
