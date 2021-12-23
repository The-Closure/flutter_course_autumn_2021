import 'package:flutter_course_autumn_2021/model/auth_model.dart';
import 'package:flutter_course_autumn_2021/service/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  AuthService authService = AuthService();
  test('valid auth data', () async {
    AuthModel? data = await authService.authUser(
      AuthModel(password: 'admin', rememberMe: true, username: 'admin'),
    );
    expect(data.runtimeType, AuthModel);
  });
  test('invalid auth data', () async {
    AuthModel? data = await authService.authUser(
      AuthModel(password: 'user', rememberMe: true, username: 'admin'),
    );
    expect(data ?? 'success test', 'success test');
  });
}
