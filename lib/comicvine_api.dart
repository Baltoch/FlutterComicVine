import 'package:dio/dio.dart';
import 'package:fluttercomicvine/comicvine_model.dart';
import 'package:retrofit/retrofit.dart';

part 'comicvine_api.g.dart';

@RestApi()
abstract class ComicVineAPI {
  factory ComicVineAPI(Dio dio, {required String baseUrl}) = _ComicVineAPI;

  // https://comicvine.gamespot.com/api/issues/?api_key=8b4409f69ab868bcc3cbbe34dd52b3e19db555fd&format=json
  @GET('characters')
  Future<ComicVineCharactersResponse> loadCharacters(
      {@Query('limit') int limit = 20});

  @GET('issues')
  Future<ComicVineIssuesResponse> loadIssues({@Query('limit') int limit = 50});

  @GET('movies')
  Future<ComicVineMoviesResponse> loadMovies({@Query('limit') int limit = 50});

  @GET('series_list')
  Future<ComicVineSeriesResponse> loadSeries({@Query('limit') int limit = 50});
}

class ComicVineRequests {
  /// Singleton
  static final ComicVineRequests _singleton = ComicVineRequests._internal();

  factory ComicVineRequests() {
    return _singleton;
  }

  ComicVineRequests._internal();

  final ComicVineAPI _api = ComicVineAPI(
    Dio(
      BaseOptions(queryParameters: {
        'api_key': '8b4409f69ab868bcc3cbbe34dd52b3e19db555fd',
        'format': 'json',
      }),
    ),
    baseUrl: 'https://comicvine.gamespot.com/api/',
  );

  Future<ComicVineCharactersResponse> getCharacters() {
    try {
      return _api.loadCharacters(limit: 20);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<ComicVineIssuesResponse> getIssues() {
    try {
      return _api.loadIssues(limit: 20);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<ComicVineMoviesResponse> getMovies() {
    try {
      return _api.loadMovies(limit: 20);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<ComicVineSeriesResponse> getSeries() {
    try {
      return _api.loadSeries(limit: 20);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
