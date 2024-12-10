import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login(BuildContext context) {
    final username = usernameController.text;
    final password = passwordController.text;

    if (username == "pengguna" && password == "masuk") {
      _isLoggedIn = true;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login Successful!"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushNamed(context, '/gallery');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid username or password!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
