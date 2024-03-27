import 'package:json_annotation/json_annotation.dart';

part 'comicvine_model.g.dart';

@JsonSerializable()
class ComicVineCharactersResponse {
  @JsonKey(name: 'results')
  final List<ComicVineCharacter> results;

  ComicVineCharactersResponse(this.results);

  factory ComicVineCharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicVineCharactersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineCharactersResponseToJson(this);
}

@JsonSerializable()
class ComicVineCharacter {
  @JsonKey(name: 'aliases')
  final String? aliases;

  @JsonKey(name: 'count_of_issue_appearances')
  final int? countOfIssueAppearances;

  @JsonKey(name: 'image')
  final Map<String, dynamic>? image;

  ComicVineCharacter(this.aliases, this.countOfIssueAppearances, this.image);

  factory ComicVineCharacter.fromJson(Map<String, dynamic> json) =>
      _$ComicVineCharacterFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineCharacterToJson(this);
}

@JsonSerializable()
class ComicVineIssuesResponse {
  @JsonKey(name: 'results')
  final List<ComicVineIssue> results;

  ComicVineIssuesResponse(this.results);

  factory ComicVineIssuesResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicVineIssuesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineIssuesResponseToJson(this);
}

@JsonSerializable()
class ComicVineIssue {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'issue_number')
  final String? issueNumber;

  @JsonKey(name: 'image')
  final Map<String, dynamic>? image;

  ComicVineIssue(this.name, this.issueNumber, this.image);

  factory ComicVineIssue.fromJson(Map<String, dynamic> json) =>
      _$ComicVineIssueFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineIssueToJson(this);
}

@JsonSerializable()
class ComicVineMoviesResponse {
  @JsonKey(name: 'results')
  final List<ComicVineMovie> results;

  ComicVineMoviesResponse(this.results);

  factory ComicVineMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicVineMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineMoviesResponseToJson(this);
}

@JsonSerializable()
class ComicVineMovie {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'budget')
  final String? budget;

  @JsonKey(name: 'image')
  final Map<String, dynamic>? image;

  ComicVineMovie(this.name, this.budget, this.image);

  factory ComicVineMovie.fromJson(Map<String, dynamic> json) =>
      _$ComicVineMovieFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineMovieToJson(this);
}
