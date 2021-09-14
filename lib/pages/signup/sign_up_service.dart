// ignore_for_file: import_of_legacy_library_into_null_safe
import 'dart:convert';

import 'package:ifeira_app_1/shared/constants/routes.dart';
import 'package:http/http.dart' as http;

class SignUpService {
  signUp(String nome, String email, String password) async {
    http.Response response = await http.post(
      Uri.parse(Routes().signIn()),
      body: json.encode(
        {
          "nome": nome,
          "email": email,
          "password": password,
          "returnSecureToken": true,
        },
      ),
    );

    print(response.body);
  }
}
