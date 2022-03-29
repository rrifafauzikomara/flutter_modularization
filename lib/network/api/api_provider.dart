import 'dart:async';
import 'dart:convert';

import 'package:flutter_modularization/network/model/movie.dart';
import 'package:http/http.dart' show Client;

class ApiProvider {
  Client client = Client();

  //TODO: Add your api key here
  static final _apiKey = 'YOUR_API_KEY';
  static final String _baseUrl = 'http://api.themoviedb.org/3/movie';

  Future<Movie> getMovieList() async {
    final url = Uri.parse("$_baseUrl/popular?api_key=$_apiKey");
    final response = await client.get(url);
    if (response.statusCode == 200) {
      return Movie.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movie');
    }
  }
}
