import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _urlBase = 'api.themoviedb.org';
  final String _contextPath = '/3/discover/movie';
  List<Result> onDisplayMovies = [];
  List<Result> popularMovies = [];
  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(
      _urlBase,
      _contextPath,
      {
        'include_adult': 'false',
        'include_video': 'false',
        'language': 'es-ES',
        'page': '1',
        'sort_by': 'popularity.desc',
        'with_release_type': '2|3',
        'release_date.gte': '2022-01-01',
        'release_date.lte': '2022-12-31'
      },
    );

    var response = await http.get(
      url,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYjI2YmM5Y2Y5ODMxNGNhNzUyNzUzZDljYjUwMTZmOSIsIm5iZiI6MTcyMTE0NzIwNi44ODQ1NDYsInN1YiI6IjY2OTY5ZTI4NGVlYWU0MzRhMWRmODE5MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-nw-htDO00vB_e3uFoXpRDWRz-lMT6NlFXjIbwWVF1U',
        'accept': 'application/json',
      },
    );
    final nowPlayingResponse =
        NowPlayingResponse.fromJson(convert.jsonDecode(response.body));
    onDisplayMovies = nowPlayingResponse.results!;
    notifyListeners();
  }

  getPopularMovies() async {
    var url = Uri.https(
      'api.themoviedb.org',
      '/3/discover/movie',
      {
        'include_adult': 'false',
        'include_video': 'false',
        'language': 'en-US',
        'page': '1',
        'sort_by': 'popularity.desc'
      },
    );

    var response = await http.get(
      url,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYjI2YmM5Y2Y5ODMxNGNhNzUyNzUzZDljYjUwMTZmOSIsIm5iZiI6MTcyMTE0NzIwNi44ODQ1NDYsInN1YiI6IjY2OTY5ZTI4NGVlYWU0MzRhMWRmODE5MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.-nw-htDO00vB_e3uFoXpRDWRz-lMT6NlFXjIbwWVF1U',
        'accept': 'application/json',
      },
    );

    final popularResponse =
        PopularResponse.fromJson(convert.jsonDecode(response.body));
    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }
}
