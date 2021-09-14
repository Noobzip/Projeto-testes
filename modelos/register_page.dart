import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:ifeira_app_1/pages/login_page.dart';

class TelaCadastro extends StatelessWidget {
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
        key: _formKey,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 230,
              height: 230,
              child: Image.asset("assets/image/logo.png"),
            ),
            Container(
              child: Text(
                "REGISTRO",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 20,
            ),
            TextFormField(
              //Nome----------------------------------------------------
              validator: (value) {
                if (value!.length < 3) {
                  return "Este nome está certo?";
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome',
                  labelStyle: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    //adicionar a possibilidade de esse valor ser mutavel pelo usuario
                  ),
                  prefixIcon: Icon(Icons.person)),
              style: TextStyle(fontSize: 20),
            ),
            Padding(
                //E-mail----------------------------------------------------
                padding: EdgeInsets.only(top: 20),
                child: TextFormField(
                  validator: (value) {
                    if (value!.length < 5 ||
                        value.contains("@") ||
                        value.contains(".com")) {
                      return "Este e-mail é inválido.";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'E-mail',
                      labelStyle: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w400,
                          fontSize:
                              20 //adicionar a possibilidade de esse valor ser mutavel pelo usuario
                          ),
                      prefixIcon: Icon(Icons.email_outlined)),
                  style: TextStyle(fontSize: 20),
                )),
            Padding(
                //Senha----------------------------------------------------
                padding: EdgeInsets.only(top: 20),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Este campo é obrigatório.";
                    }
                    if (value.length < 6) {
                      return "Senha muito fraca";
                    }
                    if (value.contains("1") ||
                        value.contains("2") ||
                        value.contains("3") ||
                        value.contains("4") ||
                        value.contains("5") ||
                        value.contains("6") ||
                        value.contains("7") ||
                        value.contains("8") ||
                        value.contains("9") ||
                        value.contains("0")) {
                      return "A senha deve conter no mínimo um número.";
                    } else {
                      return null;
                    }
                  },
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
                      prefixIcon: Icon(Icons.vpn_key_outlined)),
                  style: TextStyle(fontSize: 20),
                )),
            SizedBox(
              height: 30,
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black54,
                backgroundColor: Colors.green,
              ),
              child: Text("REGISTRAR-SE", textScaleFactor: 1.5),
              onPressed: () {
                _formKey.currentState?.reset();
                _formKey.currentState?.validate();
              },
            ),
            Container(
              //Botão----------------------------------------------------
              height: 70,
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text(
                  "Já possui conta? Faça o login agora.",
                  textAlign: TextAlign.right,
                ),
                onPressed: () {
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => TelaLogin()));*/
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
