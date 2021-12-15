import 'package:bloc/bloc.dart';
import 'package:flutter_course_autumn_2021/model/auth_model.dart';
import 'package:flutter_course_autumn_2021/service/auth_service.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignInEvent>((event, emit) async {
      emit(ProcessingSignInState());
      AuthModel? user = await authService.authUser(event.user);
      user == null
          ? emit(FaildAuthState())
          : emit(SuccessedSignInState(user: user));

      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('backend_user', user.toString());
    });
  }
  final authService = AuthService();
}
