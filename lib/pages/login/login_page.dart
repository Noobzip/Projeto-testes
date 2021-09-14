import 'package:flutter/material.dart';
import 'package:ifeira_app_1/pages/login/login_service.dart';
import 'package:ifeira_app_1/pages/signup/sign_up_page.dart';
import 'package:ifeira_app_1/shared/constants/custom_colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  bool _obscurePassword = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        color: Colors.white70,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: 7,
                ),
                child: Image.asset(
                  "assets/image/logo.png",
                  height: 125,
                ),
              ),
              Text(
                "Entrar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.length < 5) {
                          return "Por favor, insira um e-mail válido";
                        } else if (!value.contains("@")) {
                          return "E-mail invalido";
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
                    TextFormField(
                      validator: (value) {
                        if (value!.length < 6) {
                          return "A senha deve ter no mínimo 6 caracteres";
                        }
                        return null;
                      },
                      obscureText: _obscurePassword,
                      controller: _passwordInputController,
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
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Esqueceu a senha?",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              Row(
                children: [
                  Checkbox(
                      value: this._obscurePassword,
                      activeColor: Colors.blue,
                      onChanged: (bool? value) {
                        if (_obscurePassword = true) {
                          value = false;
                        }
                      }),
                  Text(
                    "Mostrar senha",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  _doLogin();
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    CustomColors().getActivePrimaryButtonColor(),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              Text(
                "Ainda não tem uma conta?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 11),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ),
                    );
                  },
                  child: Text("Cadastre-se"),
                  color: CustomColors().getActiveSecondaryButton(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _doLogin() async {
    if (_formKey.currentState!.validate()) {
      LoginService()
          .login(_mailInputController.text, _passwordInputController.text);
    } else {
      print("invalido");
    }
  }

  // Future<LoginModel> _getSavedUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String jsonUser = prefs.getString(PreferencesKeys.activeUser);
  //   print(jsonUser);

  //   Map<String, dynamic> mapUser = json.decode(jsonUser);
  //   LoginModel user = LoginModel.fromJson(mapUser);
  //   return user;
  // }
}

// WIDGETS
// BoxDecoration
// LinearGradient
// MediaQuery.of(context).size.width
// SingleChildScrollView
// Column
// Form
// TextFormField
// InputDecoration
// GestureDectector
