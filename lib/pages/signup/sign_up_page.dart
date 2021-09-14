import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ifeira_app_1/pages/signup/sign_up_service.dart';
import 'package:ifeira_app_1/shared/constants/custom_colors.dart';
import 'package:ifeira_app_1/shared/constants/preferences_keys.dart';
import 'package:ifeira_app_1/shared/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  TextEditingController _confirmInputController = TextEditingController();

  bool showPassword = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 50,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Cadastro",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.length < 10) {
                          return "Digite um nome maior";
                        }
                        return null;
                      },
                      controller: _nameInputController,
                      autofocus: true,
                      style: TextStyle(color: Colors.black54),
                      decoration: InputDecoration(
                        labelText: "Nome Completo",
                        labelStyle: TextStyle(
                          color: Colors.black54,
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black54,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black54,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.length < 5) {
                          return "Esse e-mail parece curto demais";
                        } else if (!value.contains("@")) {
                          return "Esse e-mail está meio estranho, não?";
                        }
                        return null;
                      },
                      controller: _mailInputController,
                      autofocus: true,
                      style: TextStyle(color: Colors.black54),
                      decoration: InputDecoration(
                        labelText: "E-mail",
                        labelStyle: TextStyle(
                          color: Colors.black54,
                        ),
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: Colors.black54,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black54,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 15,
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.length < 6) {
                          return "A senha deve ter pelo menos 6 caracteres";
                        }
                        return null;
                      },
                      controller: _passwordInputController,
                      obscureText: (this.showPassword == true) ? false : true,
                      style: TextStyle(color: Colors.black54),
                      decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Colors.black54,
                        ),
                        prefixIcon: Icon(
                          Icons.vpn_key_sharp,
                          color: Colors.black54,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black54,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                    (this.showPassword == false)
                        ? TextFormField(
                            validator: (value) {
                              if (value != _passwordInputController.text) {
                                return "As senhas devem ser iguais";
                              }
                              return null;
                            },
                            controller: _confirmInputController,
                            obscureText: true,
                            style: TextStyle(color: Colors.black54),
                            decoration: InputDecoration(
                              labelText: "Confirme a Senha",
                              labelStyle: TextStyle(
                                color: Colors.black54,
                              ),
                              prefixIcon: Icon(
                                Icons.vpn_key_sharp,
                                color: Colors.black54,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black54,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    Row(
                      children: [
                        Checkbox(
                          value: this.showPassword,
                          activeColor: Colors.blue,
                          onChanged: (bool? value) {},
                        ),
                        Text(
                          "Mostrar senha",
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                onPressed: () {
                  _doSignUp();
                },
                child: Text("Casdastrar"),
                color: CustomColors().getActiveSecondaryButton(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _doSignUp() {
    if (_formKey.currentState!.validate()) {
      SignUpService().signUp(
        _nameInputController.text,
        _mailInputController.text,
        _passwordInputController.text,
      );
    } else {
      print("invalido");
    }

    // LoginModel newUser = LoginModel(
    //   name: _nameInputController.text,
    //   mail: _mailInputController.text,
    //   password: _passwordInputController.text,
    //   keepOn: true,
    // );

    // _saveUser(newUser);
  }

  // ignore: unused_element
  void _saveUser(LoginModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      PreferencesKeys.activeUser,
      json.encode(user.toJson()),
    );
  }
}
