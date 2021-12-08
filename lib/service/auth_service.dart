import 'package:connectivity/connectivity.dart';
import 'package:flutter_course_autumn_2021/model/auth_model.dart';

class AuthService {
  Future<User> signIn(User user) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (!(connectivityResult == ConnectivityResult.none)) {
      if (user.email == 'flutter@dev.com' && user.password == 'pass') {
        return User(
          email: user.email,
          password: user.password,
          id: 1,
          img: '',
          token: 'zvcvzvzcvadret45455fvcxvb',
        );
      } else if (user.email == 'flutter@dev.com') {
        return User(
            id: -1,
            email: 'null',
            password: 'null',
            token: 'password incorrect');
      } else {
        return User(
            id: -1, email: 'null', password: 'null', token: 'email incorrect');
      }
    } else {
      return User(
          id: -1,
          email: 'null',
          password: 'null',
          token: 'no internet connection');
    }
  }
}
