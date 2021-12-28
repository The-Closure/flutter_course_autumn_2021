import 'package:flutter_course_autumn_2021/bloc/auth_bloc/auth_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_course_autumn_2021/model/auth_model.dart';
import 'package:flutter_course_autumn_2021/model/user_details_model.dart';

void main() {
  blocTest<AuthBloc, AuthState>(
    'test auth bloc for bad credentials',
    build: () => AuthBloc(),
    act: (bloc) => bloc.add(
      SignInEvent(
        user:
            AuthModel(password: 'adminn', rememberMe: true, username: 'admin'),
      ),
    ),
    wait: Duration(seconds: 3),
    expect: () => [ProcessingSignInState(), FaildAuthState()],
  );
  blocTest<AuthBloc, AuthState>(
    'test auth bloc for right credentials',
    build: () => AuthBloc(),
    act: (bloc) => bloc.add(
      SignInEvent(
        user: AuthModel(password: 'admin', rememberMe: true, username: 'admin'),
      ),
    ),
    wait: Duration(seconds: 3),
    expect: () => [
      ProcessingSignInState(),
      SuccessedSignInState(
        user: AuthModel(password: 'admin', rememberMe: true, username: 'admin'),
      )
    ],
  );
}
