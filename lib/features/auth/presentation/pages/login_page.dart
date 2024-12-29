import 'package:flutter/material.dart';

import '../widgets/auth_button.dart';
import '../widgets/auth_input_field.dart';
import '../widgets/login_prompt.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _showInputValues() {
    String email = _emailController.text;
    String password = _passwordController.text;

    print('Email: $email \nPassword: $password');
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthInputField(hint: 'Email', icon: Icons.email, controller: _emailController),
              const SizedBox(height: 20),
              AuthInputField(hint: 'Password', icon: Icons.lock, controller: _passwordController, isPassword: true,),
              const SizedBox(height: 20),
              AuthButton(
                text: 'Login',
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              LoginPrompt(
                title: "Don't have an account?",
                subtitle: 'Click here to register',
                onTap: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

