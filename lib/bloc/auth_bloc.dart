import 'package:bloc/bloc.dart';
import 'package:flutter_course_autumn_2021/model/auth_model.dart';
import 'package:flutter_course_autumn_2021/service/auth_service.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());
  final authService = AuthService();
  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    yield AuthInitial();
    if (event is SignInEvent) {
      yield ProcessingSignInState();
      User resulUser = await authService.signIn(event.user);
      if (resulUser.id != -1) {
        yield SuccessedSignInState(user: resulUser);
      } else {
        if (resulUser.token.contains('email'))
          yield WrongEmailState(errorMessage: resulUser.token);
        else if (resulUser.token.contains('password'))
          yield WrongPasswordState(errorMessage: resulUser.token);
        else if (resulUser.token.contains('internet'))
          yield NoConnectionState();
      }
    }
  }
}
