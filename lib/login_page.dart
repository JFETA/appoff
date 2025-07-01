import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página de Login'),
      ),
      body: Center(
        child: Text(
          'Esta es la página de Login',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
