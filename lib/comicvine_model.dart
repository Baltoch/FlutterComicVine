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

  ComicVineCharacter(this.aliases);

  factory ComicVineCharacter.fromJson(Map<String, dynamic> json) =>
      _$ComicVineCharacterFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineCharacterToJson(this);
}
