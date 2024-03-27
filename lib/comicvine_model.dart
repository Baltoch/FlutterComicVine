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
