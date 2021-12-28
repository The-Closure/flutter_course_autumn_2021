import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

@GenerateMocks([http.Client])
void main() {
  test('description', () {});
  test('returns an Album if the http call completes successfully', () async {
    final client = MockClient((request) async {
      return http.Response('', 3);
    });

    // Use Mockito to return a successful response when it calls the
    // provided http.Client.
    when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
        .thenAnswer((_) async => http.Response(
            '{"username": "admin", "password": "admin", "rememberMe": true, "token":"sdfafafadsfasd"}',
            200));

    // expect(, isA<Album>());
  });
}
