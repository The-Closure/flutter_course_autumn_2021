import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_autumn_2021/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_course_autumn_2021/model/auth_model.dart';
import 'package:flutter_course_autumn_2021/ui/locations_page.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is SuccessedSignInState)
                Navigator.of(context).popAndPushNamed('/locations_page');
              else if (state is FaildAuthState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Faild Authentication')));
              }
            },
            builder: (context, state) {
              if (state is AuthInitial)
                return SignInForm(
                    emailController: emailController,
                    passwordController: passwordController);
              else if (state is ProcessingSignInState)
                return CircularProgressIndicator();
              else if (state is FaildAuthState)
                return SignInForm(
                    emailController: emailController,
                    passwordController: passwordController);
              else
                return Text('something went wrong');
            },
          ),
        ));
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
            final user = AuthModel(
                rememberMe: true,
                username: emailController.text,
                password: passwordController.text);
            BlocProvider.of<AuthBloc>(context).add(SignInEvent(user: user));
          },
          child: Text('Sign In'),
        )
      ],
    );
  }
}
