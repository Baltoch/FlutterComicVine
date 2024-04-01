import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';
import './comicvine_model.dart';

part 'comicvine_api.g.dart';

@RestApi()
abstract class ComicVineAPI {
  factory ComicVineAPI(Dio dio, {required String baseUrl}) = _ComicVineAPI;

  // https://comicvine.gamespot.com/api/issues?api_key=8b4409f69ab868bcc3cbbe34dd52b3e19db555fd&format=json&field_list=id,name,image,volume,issue_number,cover_date&limit=20&offset=0
  @GET('issues')
  Future<ComicVineIssuesResponse> loadIssues(
      {@Query('field_list')
      String? fieldList = 'id,name,image,volume,issue_number,cover_date',
      @Query('limit') int? limit = 5,
      @Query('offset') int? offset = 0,
      @Query('filter') String? filter});

  // https://comicvine.gamespot.com/api/issue/4000-{id}?api_key=8b4409f69ab868bcc3cbbe34dd52b3e19db555fd&format=json&field_list=name,image,volume,issue_number,cover_date,description,person_credits,character_credits
  @GET('issue/4000-{id}')
  Future<ComicVineIssueResponse> loadIssue(@Path('id') int id,
      {@Query('field_list') String? fieldList =
          'name,image,volume,issue_number,cover_date,description,person_credits,character_credits'});

  // https://comicvine.gamespot.com/api/movies?api_key=8b4409f69ab868bcc3cbbe34dd52b3e19db555fd&format=json&field_list=id,image,runtime,date_added,api_detail_url,name&limit=20&offset=0
  @GET('movies')
  Future<ComicVineMoviesResponse> loadMovies(
      {@Query('field_list')
      String? fieldList = 'id,image,runtime,date_added,api_detail_url,name',
      @Query('limit') int? limit = 5,
      @Query('offset') int? offset = 0,
      @Query('filter') String? filter});

  // https://comicvine.gamespot.com/api/movie/4025-{id}/?api_key=8b4409f69ab868bcc3cbbe34dd52b3e19db555fd&format=json&field_list=name,image,runtime,date_added,description,characters,rating,writers,producers,studios,budget,box_office_revenue,total_revenue
  @GET('movie/4025-{id}')
  Future<ComicVineMovieResponse> loadMovie(@Path('id') int id,
      {@Query('field_list') String? fieldList =
          'name,image,runtime,date_added,description,characters,rating,writers,producers,studios,budget,box_office_revenue,total_revenue'});

  // https://comicvine.gamespot.com/api/series_list?api_key=8b4409f69ab868bcc3cbbe34dd52b3e19db555fd&format=json&field_list=id,name,image,publisher,count_of_episodes,start_year&limit=20&offset=0
  @GET('series_list')
  Future<ComicVineSeriesListResponse> loadSeriesList(
      {@Query('field_list') String? fieldList =
          'id,name,image,publisher,count_of_episodes,start_year',
      @Query('limit') int? limit = 5,
      @Query('offset') int? offset = 0,
      @Query('filter') String? filter});

  // https://comicvine.gamespot.com/api/series/4075-{id}/?api_key=8b4409f69ab868bcc3cbbe34dd52b3e19db555fd&format=json&field_list=name,image,publisher,count_of_episodes,start_year,description,characters,episodes
  @GET('series/4075-{id}')
  Future<ComicVineSeriesResponse> loadSeries(@Path('id') int id,
      {@Query('field_list') String? fieldList =
          'name,image,publisher,count_of_episodes,start_year,description,characters,episodes'});

  // https://comicvine.gamespot.com/api/episode/4070-{id}/?api_key=8b4409f69ab868bcc3cbbe34dd52b3e19db555fd&format=json&field_list=image,episode_number,name,air_date
  @GET('episode/4070-{id}')
  Future<ComicVineEpisodeResponse> loadEpisode(@Path('id') int id,
      {@Query('field_list')
      String? fieldList = 'image,episode_number,name,air_date'});

  // https://comicvine.gamespot.com/api/person/4040-{id}/?api_key=8b4409f69ab868bcc3cbbe34dd52b3e19db555fd&format=json&field_list=image,name,deck,description,aliases,birth,country,death,gender,hometown,website
  @GET('person/4040-{id}')
  Future<ComicVinePersonResponse> loadPerson(@Path('id') int id,
      {@Query('field_list') String? fieldList =
          'image,name,deck,description,aliases,birth,country,death,gender,hometown,website'});

  // https://comicvine.gamespot.com/api/character/4005-{id}/?api_key=8b4409f69ab868bcc3cbbe34dd52b3e19db555fd&format=json&field_list=image,name,description,real_name,aliases,publisher,creators,gender,birth
  @GET('character/4005-{id}')
  Future<ComicVineCharacterResponse> loadCharacter(@Path('id') int id,
      {@Query('field_list') String? fieldList =
          'image,name,description,real_name,aliases,publisher,creators,gender,birth'});

  // https://comicvine.gamespot.com/api/characters?api_key=8b4409f69ab868bcc3cbbe34dd52b3e19db555fd&format=json&field_list=id,name,image,site_detail_url&limit=30
  @GET('characters')
  Future<ComicVineCharactersResponse> loadCharacters(
      {@Query('field_list') String? fieldList = 'id,name,image,site_detail_url',
      @Query('limit') int? limit = 5,
      @Query('offset') int? offset = 0,
      @Query('filter') String? filter});
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
        'api_key': 'ac0e4b56140119e1bf5433a18cbd8d63772bac5c',
        'format': 'json',
      }),
    ),
    baseUrl: 'https://comicvine.gamespot.com/api/',
  );

  //Request "Comics"
  Future<ComicVineIssuesResponse> getIssues(int limit) {
    try {
      return _api.loadIssues(limit: limit);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<ComicVineIssuesResponse> filterIssues({String? filter, int? limit}) {
    try {
      return _api.loadIssues(
          limit: limit, filter: filter == null ? null : 'name:$filter');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<ComicVineIssueResponse> getIssue(int id) {
    try {
      return _api.loadIssue(id);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  //Request "Films"
  Future<ComicVineMoviesResponse> getMovies(int limit) {
    try {
      return _api.loadMovies(limit: limit);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<ComicVineMoviesResponse> filterMovies({String? filter, int? limit}) {
    try {
      return _api.loadMovies(
          limit: limit, filter: filter == null ? null : 'name:$filter');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<ComicVineMovieResponse> getMovie(int id) {
    try {
      return _api.loadMovie(id);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  //Request "Series"
  Future<ComicVineSeriesListResponse> getSeriesList(int limit) {
    try {
      return _api.loadSeriesList(limit: limit);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<ComicVineSeriesListResponse> filterSeriesList(
      {String? filter, int? limit}) {
    try {
      return _api.loadSeriesList(
          limit: limit, filter: filter == null ? null : 'name:$filter');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<ComicVineSeriesResponse> getSeries(int id) {
    try {
      return _api.loadSeries(id);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  //Request "episode"
  Future<ComicVineEpisodeResponse> getEpisode(int id) {
    try {
      return _api.loadEpisode(id);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  //Request "person"
  Future<ComicVinePersonResponse> getPerson(int id) {
    try {
      return _api.loadPerson(id);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  //Request "character"
  Future<ComicVineCharacterResponse> getCharacter(int id) {
    try {
      return _api.loadCharacter(id);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future<ComicVineCharactersResponse> filterCharacters(
      {String? filter, int? limit}) {
    try {
      return _api.loadCharacters(
          limit: limit, filter: filter == null ? null : 'name:$filter');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }
}
