// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comicvine_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ComicVineAPI implements ComicVineAPI {
  _ComicVineAPI(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ComicVineIssuesResponse> loadIssues({
    String? fieldList = 'id,name,image,volume,issue_number,cover_date',
    int? limit = 5,
    int? offset = 0,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'field_list': fieldList,
      r'limit': limit,
      r'offset': offset,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ComicVineIssuesResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'issues',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ComicVineIssuesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ComicVineIssueResponse> loadIssue(
    int id, {
    String? fieldList =
        'name,image,volume,issue_number,cover_date,description,person_credits,character_credits',
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'field_list': fieldList};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ComicVineIssueResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'issue/4000-${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ComicVineIssueResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ComicVineMoviesResponse> loadMovies({
    String? fieldList = 'id,image,runtime,date_added,api_detail_url,name',
    int? limit = 5,
    int? offset = 0,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'field_list': fieldList,
      r'limit': limit,
      r'offset': offset,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ComicVineMoviesResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'movies',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ComicVineMoviesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ComicVineMovieResponse> loadMovie(
    int id, {
    String? fieldList =
        'name,image,runtime,date_added,description,characters,rating,writers,producers,studios,budget,box_office_revenue,total_revenue',
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'field_list': fieldList};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ComicVineMovieResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'movie/4025-${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ComicVineMovieResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ComicVineSeriesListResponse> loadSeriesList({
    String? fieldList = 'id,name,image,publisher,count_of_episodes,start_year',
    int? limit = 5,
    int? offset = 0,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'field_list': fieldList,
      r'limit': limit,
      r'offset': offset,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ComicVineSeriesListResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'series_list',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ComicVineSeriesListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ComicVineSeriesResponse> loadSeries(
    int id, {
    String? fieldList =
        'name,image,publisher,count_of_episodes,start_year,description,characters,episodes',
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'field_list': fieldList};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ComicVineSeriesResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'series/4075-${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ComicVineSeriesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ComicVineEpisodeResponse> loadEpisode(
    int id, {
    String? fieldList = 'image,episode_number,name,air_date',
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'field_list': fieldList};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ComicVineEpisodeResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'episode/4070-${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ComicVineEpisodeResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ComicVinePersonResponse> loadPerson(
    int id, {
    String? fieldList =
        'image,name,deck,description,aliases,birth,country,death,gender,hometown,website',
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'field_list': fieldList};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ComicVinePersonResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'person/4040-${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ComicVinePersonResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ComicVineCharacterResponse> loadCharacter(
    int id, {
    String? fieldList =
        'image,name,description,real_name,aliases,publisher,creators,gender,birth',
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'field_list': fieldList};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ComicVineCharacterResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'character/4005-${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ComicVineCharacterResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
