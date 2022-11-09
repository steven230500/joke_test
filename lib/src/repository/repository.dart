import 'package:dio/dio.dart';
import 'package:prueba_joke/src/models/joke.dart';

class Respository {
  final dio = Dio();

  Future<List<Joke>> getJoke() async {
    const url = "https://api.chucknorris.io/jokes/random";
    List<Joke> jokes = [];

    for (var i = 0; i < 20; i++) {
      final response = await dio.get(url);
      jokes.add(Joke.fromJson(response.data));
    }

    return jokes;
  }
}
