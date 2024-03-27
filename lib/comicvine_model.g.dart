// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comicvine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicVineCharactersResponse _$ComicVineCharactersResponseFromJson(
        Map<String, dynamic> json) =>
    ComicVineCharactersResponse(
      (json['results'] as List<dynamic>)
          .map((e) => ComicVineCharacter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicVineCharactersResponseToJson(
        ComicVineCharactersResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ComicVineCharacter _$ComicVineCharacterFromJson(Map<String, dynamic> json) =>
    ComicVineCharacter(
      json['aliases'] as String?,
      json['count_of_issue_appearances'] as int?,
      json['image'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ComicVineCharacterToJson(ComicVineCharacter instance) =>
    <String, dynamic>{
      'aliases': instance.aliases,
      'count_of_issue_appearances': instance.countOfIssueAppearances,
      'image': instance.image,
    };

ComicVineIssuesResponse _$ComicVineIssuesResponseFromJson(
        Map<String, dynamic> json) =>
    ComicVineIssuesResponse(
      (json['results'] as List<dynamic>)
          .map((e) => ComicVineIssue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicVineIssuesResponseToJson(
        ComicVineIssuesResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ComicVineIssue _$ComicVineIssueFromJson(Map<String, dynamic> json) =>
    ComicVineIssue(
      json['name'] as String?,
      json['issue_number'] as String?,
      json['image'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ComicVineIssueToJson(ComicVineIssue instance) =>
    <String, dynamic>{
      'name': instance.name,
      'issue_number': instance.issueNumber,
      'image': instance.image,
    };

ComicVineMoviesResponse _$ComicVineMoviesResponseFromJson(
        Map<String, dynamic> json) =>
    ComicVineMoviesResponse(
      (json['results'] as List<dynamic>)
          .map((e) => ComicVineMovie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicVineMoviesResponseToJson(
        ComicVineMoviesResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ComicVineMovie _$ComicVineMovieFromJson(Map<String, dynamic> json) =>
    ComicVineMovie(
      json['name'] as String?,
      json['budget'] as String?,
      json['image'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ComicVineMovieToJson(ComicVineMovie instance) =>
    <String, dynamic>{
      'name': instance.name,
      'budget': instance.budget,
      'image': instance.image,
    };

ComicVineSeriesResponse _$ComicVineSeriesResponseFromJson(
        Map<String, dynamic> json) =>
    ComicVineSeriesResponse(
      (json['results'] as List<dynamic>)
          .map((e) => ComicVineSerie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicVineSeriesResponseToJson(
        ComicVineSeriesResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ComicVineSerie _$ComicVineSerieFromJson(Map<String, dynamic> json) =>
    ComicVineSerie(
      json['name'] as String?,
      json['count_of_episodes'] as int?,
      json['image'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ComicVineSerieToJson(ComicVineSerie instance) =>
    <String, dynamic>{
      'name': instance.name,
      'count_of_episodes': instance.countOfEpisodes,
      'image': instance.image,
    };
