import 'package:json_annotation/json_annotation.dart';

part 'comicvine_model.g.dart';

//-------------------------Personnages---------------------------//

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

//-------------------------Comics---------------------------//

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
  //Card props
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'issue_number')
  final String? issueNumber;

  @JsonKey(name: 'image')
  final Map<String, dynamic>? image;
  //To get the same image as shown in the sketch, use this this command : image?['small_url']

  @JsonKey(name: 'volume')
  final Map<String, dynamic>? volume;
  // Here we need the "name" attribute of the "Volume" object, so to get that use this command : volume?['name']

  //"Histoire" props
  @JsonKey(name: 'description')
  final String? description;

  ComicVineIssue(
      this.name, this.issueNumber, this.image, this.volume, this.description);

  factory ComicVineIssue.fromJson(Map<String, dynamic> json) =>
      _$ComicVineIssueFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineIssueToJson(this);
}

//-------------------------Films---------------------------//

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

//-------------------------Series---------------------------//

@JsonSerializable()
class ComicVineSeriesResponse {
  @JsonKey(name: 'results')
  final List<ComicVineSerie> results;

  ComicVineSeriesResponse(this.results);

  factory ComicVineSeriesResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicVineSeriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineSeriesResponseToJson(this);
}

@JsonSerializable()
class ComicVineSerie {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'count_of_episodes')
  final int? countOfEpisodes;

  @JsonKey(name: 'image')
  final Map<String, dynamic>? image;

  ComicVineSerie(this.name, this.countOfEpisodes, this.image);

  factory ComicVineSerie.fromJson(Map<String, dynamic> json) =>
      _$ComicVineSerieFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineSerieToJson(this);
}
