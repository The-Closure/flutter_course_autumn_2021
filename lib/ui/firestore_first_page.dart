import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_autumn_2021/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_course_autumn_2021/model/auth_model.dart';
import 'package:flutter_course_autumn_2021/service/firestore_service.dart';
import 'package:flutter_course_autumn_2021/ui/locations_page.dart';

class FireBaseFirstPage extends StatelessWidget {
  FireBaseFirstPage({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SignInForm(
        emailController: emailController,
        passwordController: passwordController,
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  SignInForm({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 2.0),
            ),
          ),
          controller: emailController,
        ),
        TextField(
          obscureText: true,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 2.0),
            ),
          ),
          controller: passwordController,
        ),
        ElevatedButton(
          onPressed: () {
            FireStoreService().addUser(AuthModel(
                password: passwordController.text,
                token: 'EMPTY_TOKEN',
                rememberMe: true,
                username: emailController.text));
          },
          child: Text('Sign In'),
        )
      ],
    );
  }
}
