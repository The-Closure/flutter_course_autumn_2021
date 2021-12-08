import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_autumn_2021/bloc/auth_bloc.dart';
import 'package:flutter_course_autumn_2021/model/auth_model.dart';
import 'package:flutter_course_autumn_2021/ui/profile_page.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SuccessedSignInState) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ProfilePage()));
            }
          },
          listenWhen: (previous, current) => current is SuccessedSignInState,
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthInitial) {
                return SignInForm(
                    emailController: emailController,
                    passwordController: passwordController);
              } else if (state is ProcessingSignInState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is WrongEmailState) {
                return SignInForm(
                  emailController: emailController,
                  passwordController: passwordController,
                  errorEmail: state.errorMessage,
                );
              } else if (state is WrongPasswordState) {
                return SignInForm(
                  emailController: emailController,
                  passwordController: passwordController,
                  errorPassword: state.errorMessage,
                );
              } else
                return Text('data');
            },
          ),
        ),
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  SignInForm({
    Key key,
    @required this.emailController,
    @required this.passwordController,
    this.errorEmail,
    this.errorPassword,
  }) : super(key: key);

  String errorEmail;
  String errorPassword;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          style: TextStyle(color: Colors.black),
          decoration: errorEmail != null
              ? InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2.0),
                  ),
                )
              : InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                  ),
                ),
          controller: emailController,
        ),
        TextField(
          obscureText: true,
          style: TextStyle(color: Colors.black),
          decoration: errorPassword != null
              ? InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 2.0),
                  ),
                )
              : InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2.0),
                  ),
                ),
          controller: passwordController,
        ),
        ElevatedButton(
          onPressed: () {
            final user = User(
                email: emailController.text, password: passwordController.text);
            BlocProvider.of<AuthBloc>(context).add(SignInEvent(user: user));
          },
          child: Text('Sign In'),
        )
      ],
    );
  }
}
