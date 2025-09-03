import 'package:flutter/material.dart';
import '../component/custom_button.dart';
import '../component/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(label: "Username", controller: usernameC),
            const SizedBox(height: 16),
            CustomTextField(label: "Password", controller: passwordC, isPassword: true),
            const SizedBox(height: 24),
            CustomButton(
              text: "Login",
              onPressed: () {
                // koe implementasi login nang kene
              },
            ),
          ],
        ),
      ),
    );
  }
}
