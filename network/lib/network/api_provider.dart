import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:network/model/movie.dart';

class ApiProvider {
  Client client = Client();
  static final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';
  static final String _baseUrl = 'http://api.themoviedb.org/3/movie';

  Future<Movie> getMovieList() async {
    final response = await client.get("$_baseUrl/popular?api_key=$_apiKey");
    if (response.statusCode == 200) {
      return Movie.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movie');
    }
  }
}