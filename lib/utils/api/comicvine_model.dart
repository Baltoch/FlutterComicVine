import 'package:json_annotation/json_annotation.dart';

part 'comicvine_model.g.dart';

//-------------------------Comics---------------------------//

// https://comicvine.gamespot.com/api/issues?api_key=8b4409f69ab868bcc3cbbe34dd52b3e19db555fd&format=json&field_list=id,name,image,volume,issue_number,cover_date&limit=20&offset=0
@JsonSerializable()
class ComicVineIssuesResponse {
  @JsonKey(name: 'results')
  final List<ComicVineIssuesItem> results;

  @JsonKey(name: 'number_of_total_results')
  final int total;

  @JsonKey(name: 'status_code')
  final int statusCode;

  ComicVineIssuesResponse(this.results, this.total, this.statusCode);

  factory ComicVineIssuesResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicVineIssuesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineIssuesResponseToJson(this);
}

@JsonSerializable()
class ComicVineIssuesItem {
  @JsonKey(name: 'cover_date')
  final String? coverDate;

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'image')
  final ComicVineImage? image;

  @JsonKey(name: 'issue_number')
  final String? issueNumber;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'volume')
  final ComicVineVolume? volume;

  ComicVineIssuesItem(this.name, this.issueNumber, this.image, this.volume,
      this.coverDate, this.id);

  factory ComicVineIssuesItem.fromJson(Map<String, dynamic> json) =>
      _$ComicVineIssuesItemFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineIssuesItemToJson(this);
}

@JsonSerializable()
class ComicVineVolume {
  @JsonKey(name: 'api_detail_url')
  final String? apiDetailUrl;

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'site_detail_url')
  final String? siteDetailUrl;

  ComicVineVolume(this.apiDetailUrl, this.id, this.name, this.siteDetailUrl);

  factory ComicVineVolume.fromJson(Map<String, dynamic> json) =>
      _$ComicVineVolumeFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineVolumeToJson(this);
}

// https://comicvine.gamespot.com/api/issue/4000-{id}?api_key=8b4409f69ab868bcc3cbbe34dd52b3e19db555fd&format=json&field_list=name,image,volume,issue_number,cover_date,description,person_credits,character_credits
@JsonSerializable()
class ComicVineIssueResponse {
  @JsonKey(name: 'status_code')
  final int? statusCode;

  @JsonKey(name: 'results')
  final ComicVineIssue results;

  ComicVineIssueResponse(this.statusCode, this.results);

  factory ComicVineIssueResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicVineIssueResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineIssueResponseToJson(this);
}

@JsonSerializable()
class ComicVineIssue {
  @JsonKey(name: 'character_credits')
  final List<ComicVineCharactersItem>? characters;

  @JsonKey(name: 'cover_date')
  final String? coverDate;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'image')
  final ComicVineImage? image;

  @JsonKey(name: 'issue_number')
  final String? issueNumber;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'person_credits')
  final List<ComicVinePersonsItem>? persons;

  @JsonKey(name: 'volume')
  final ComicVineVolume? volume;

  ComicVineIssue(this.characters, this.coverDate, this.description, this.image,
      this.issueNumber, this.name, this.persons, this.volume);

  factory ComicVineIssue.fromJson(Map<String, dynamic> json) =>
      _$ComicVineIssueFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineIssueToJson(this);
}

//-------------------------Films---------------------------//

// https://comicvine.gamespot.com/api/movies?api_key=8b4409f69ab868bcc3cbbe34dd52b3e19db555fd&format=json&field_list=id,image,runtime,date_added,api_detail_url,name&limit=20&offset=0
@JsonSerializable()
class ComicVineMoviesResponse {
  @JsonKey(name: 'results')
  final List<ComicVineMoviesItem> results;

  @JsonKey(name: 'number_of_total_results')
  final int total;

  @JsonKey(name: 'status_code')
  final int statusCode;

  ComicVineMoviesResponse(this.results, this.total, this.statusCode);

  factory ComicVineMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicVineMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineMoviesResponseToJson(this);
}

@JsonSerializable()
class ComicVineMoviesItem {
  @JsonKey(name: 'api_detail_url')
  final String? apiDetailUrl;

  @JsonKey(name: 'date_added')
  final String? dateAdded;

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'image')
  final ComicVineImage? image;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'runtime')
  final String? runtime;

  ComicVineMoviesItem(this.apiDetailUrl, this.dateAdded, this.id, this.image,
      this.name, this.runtime);

  factory ComicVineMoviesItem.fromJson(Map<String, dynamic> json) =>
      _$ComicVineMoviesItemFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineMoviesItemToJson(this);
}

// https://comicvine.gamespot.com/api/movie/4025-{id}/?api_key=8b4409f69ab868bcc3cbbe34dd52b3e19db555fd&format=json&field_list=name,image,runtime,date_added,description,characters,rating,writers,producers,studios,budget,box_office_revenue,total_revenue
@JsonSerializable()
class ComicVineMovieResponse {
  @JsonKey(name: 'status_code')
  final int? statusCode;

  @JsonKey(name: 'results')
  final ComicVineMovie results;

  ComicVineMovieResponse(this.statusCode, this.results);

  factory ComicVineMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicVineMovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineMovieResponseToJson(this);
}

@JsonSerializable()
class ComicVineMovie {
  @JsonKey(name: 'box_office_revenue')
  final String? boxOfficeRevenue;

  @JsonKey(name: 'budget')
  final String? budget;

  @JsonKey(name: 'characters')
  final List<ComicVineCharactersItem>? characters;

  @JsonKey(name: 'date_added')
  final String? dateAdded;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'image')
  final ComicVineImage? image;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'producers')
  final List<ComicVinePersonsItem>? producers;

  @JsonKey(name: 'rating')
  final String? rating;

  @JsonKey(name: 'runtime')
  final String? runtime;

  @JsonKey(name: 'studios')
  final List<ComicVineStudio>? studios;

  @JsonKey(name: 'total_revenue')
  final String? totalRevenue;

  @JsonKey(name: 'writers')
  final List<ComicVinePersonsItem>? writers;

  ComicVineMovie(
      this.boxOfficeRevenue,
      this.budget,
      this.characters,
      this.dateAdded,
      this.description,
      this.image,
      this.name,
      this.producers,
      this.rating,
      this.runtime,
      this.studios,
      this.totalRevenue,
      this.writers);

  factory ComicVineMovie.fromJson(Map<String, dynamic> json) =>
      _$ComicVineMovieFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineMovieToJson(this);
}

@JsonSerializable()
class ComicVineStudio {
  @JsonKey(name: 'api_detail_url')
  final String? apiDetailUrl;

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'site_detail_url')
  final String? siteDetailUrl;

  ComicVineStudio(this.apiDetailUrl, this.id, this.name, this.siteDetailUrl);

  factory ComicVineStudio.fromJson(Map<String, dynamic> json) =>
      _$ComicVineStudioFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineStudioToJson(this);
}

//-------------------------Series---------------------------//

// https://comicvine.gamespot.com/api/series_list?api_key=8b4409f69ab868bcc3cbbe34dd52b3e19db555fd&format=json&field_list=id,name,image,publisher,count_of_episodes,start_year&limit=20&offset=0
@JsonSerializable()
class ComicVineSeriesListResponse {
  @JsonKey(name: 'results')
  final List<ComicVineSeriesItem> results;

  @JsonKey(name: 'number_of_total_results')
  final int total;

  @JsonKey(name: 'status_code')
  final int statusCode;

  ComicVineSeriesListResponse(this.results, this.total, this.statusCode);

  factory ComicVineSeriesListResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicVineSeriesListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineSeriesListResponseToJson(this);
}

@JsonSerializable()
class ComicVineSeriesItem {
  @JsonKey(name: 'count_of_episodes')
  final int? countOfEpisodes;

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'image')
  final ComicVineImage? image;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'publisher')
  final ComicVinePublisher? publisher;

  @JsonKey(name: 'start_year')
  final String? startYear;

  ComicVineSeriesItem(this.countOfEpisodes, this.id, this.image, this.name,
      this.publisher, this.startYear);

  factory ComicVineSeriesItem.fromJson(Map<String, dynamic> json) =>
      _$ComicVineSeriesItemFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineSeriesItemToJson(this);
}

// https://comicvine.gamespot.com/api/series/4075-{id}/?api_key=8b4409f69ab868bcc3cbbe34dd52b3e19db555fd&format=json&field_list=name,image,publisher,count_of_episodes,start_year,description,characters,episodes
@JsonSerializable()
class ComicVineSeriesResponse {
  @JsonKey(name: 'status_code')
  final int? statusCode;

  @JsonKey(name: 'results')
  final ComicVineSeries results;

  ComicVineSeriesResponse(this.statusCode, this.results);

  factory ComicVineSeriesResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicVineSeriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineSeriesResponseToJson(this);
}

@JsonSerializable()
class ComicVineSeries {
  @JsonKey(name: 'characters')
  final List<ComicVineCharactersItem>? characters;

  @JsonKey(name: 'count_of_episodes')
  final int? countOfEpisodes;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'episodes')
  final List<ComicVineEpisodesItem>? episodes;

  @JsonKey(name: 'image')
  final ComicVineImage? image;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'publisher')
  final ComicVinePublisher? publisher;

  @JsonKey(name: 'start_year')
  final String? startYear;

  ComicVineSeries(this.characters, this.countOfEpisodes, this.description,
      this.episodes, this.image, this.name, this.publisher, this.startYear);

  factory ComicVineSeries.fromJson(Map<String, dynamic> json) =>
      _$ComicVineSeriesFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineSeriesToJson(this);
}

@JsonSerializable()
class ComicVineEpisodesItem {
  @JsonKey(name: 'api_detail_url')
  final String? apiDetailUrl;

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'site_detail_url')
  final String? siteDetailUrl;

  @JsonKey(name: 'episode_number')
  final String? episodeNumber;

  ComicVineEpisodesItem(this.apiDetailUrl, this.id, this.name,
      this.siteDetailUrl, this.episodeNumber);

  factory ComicVineEpisodesItem.fromJson(Map<String, dynamic> json) =>
      _$ComicVineEpisodesItemFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineEpisodesItemToJson(this);
}

// https://comicvine.gamespot.com/api/episode/4070-{id}/?api_key=8b4409f69ab868bcc3cbbe34dd52b3e19db555fd&format=json&field_list=image,episode_number,name,air_date
@JsonSerializable()
class ComicVineEpisodeResponse {
  @JsonKey(name: 'status_code')
  final int? statusCode;

  @JsonKey(name: 'results')
  final ComicVineEpisode results;

  ComicVineEpisodeResponse(this.statusCode, this.results);

  factory ComicVineEpisodeResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicVineEpisodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineEpisodeResponseToJson(this);
}

@JsonSerializable()
class ComicVineEpisode {
  @JsonKey(name: 'air_date')
  final String? airDate;

  @JsonKey(name: 'episode_number')
  final String? episodeNumber;

  @JsonKey(name: 'image')
  final ComicVineImage? image;

  @JsonKey(name: 'name')
  final String? name;

  ComicVineEpisode(this.airDate, this.episodeNumber, this.image, this.name);

  factory ComicVineEpisode.fromJson(Map<String, dynamic> json) =>
      _$ComicVineEpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineEpisodeToJson(this);
}

// https://comicvine.gamespot.com/api/person/4040-{id}/?api_key=8b4409f69ab868bcc3cbbe34dd52b3e19db555fd&format=json&field_list=image,name,deck,description,aliases,birth,country,death,gender,hometown,website
@JsonSerializable()
class ComicVinePersonResponse {
  @JsonKey(name: 'status_code')
  final int? statusCode;

  @JsonKey(name: 'results')
  final ComicVinePerson results;

  ComicVinePersonResponse(this.statusCode, this.results);

  factory ComicVinePersonResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicVinePersonResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVinePersonResponseToJson(this);
}

@JsonSerializable()
class ComicVinePerson {
  @JsonKey(name: 'aliases')
  final String? aliases;

  @JsonKey(name: 'birth')
  final String? birth;

  @JsonKey(name: 'country')
  final String? country;

  @JsonKey(name: 'death')
  final ComicVinePersonDeath? death;

  @JsonKey(name: 'deck')
  final String? deck;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'gender')
  final int? gender;

  @JsonKey(name: 'hometown')
  final String? hometown;

  @JsonKey(name: 'image')
  final ComicVineImage? image;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'website')
  final String? website;

  ComicVinePerson(
      this.aliases,
      this.birth,
      this.country,
      this.death,
      this.deck,
      this.description,
      this.gender,
      this.hometown,
      this.image,
      this.name,
      this.website);

  factory ComicVinePerson.fromJson(Map<String, dynamic> json) =>
      _$ComicVinePersonFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVinePersonToJson(this);
}

//-------------------------Personnages---------------------------//

// https://comicvine.gamespot.com/api/characters?api_key=8b4409f69ab868bcc3cbbe34dd52b3e19db555fd&format=json&field_list=id,name,image,site_detail_url&limit=30
@JsonSerializable()
class ComicVineCharactersResponse {
  @JsonKey(name: 'results')
  final List<ComicVineCharactersItems> results;

  @JsonKey(name: 'status_code')
  final int? statusCode;

  ComicVineCharactersResponse(this.results, this.statusCode);

  factory ComicVineCharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicVineCharactersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineCharactersResponseToJson(this);
}

@JsonSerializable()
class ComicVineCharactersItems {
  @JsonKey(name: 'api_detail_url')
  final String? apiDetailUrl;

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'site_detail_url')
  final String? siteDetailUrl;

  @JsonKey(name: 'image')
  final ComicVineImage? image;

  ComicVineCharactersItems(
      this.apiDetailUrl, this.id, this.name, this.siteDetailUrl, this.image);

  factory ComicVineCharactersItems.fromJson(Map<String, dynamic> json) =>
      _$ComicVineCharactersItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineCharactersItemsToJson(this);
}

// https://comicvine.gamespot.com/api/character/4005-{id}/?api_key=8b4409f69ab868bcc3cbbe34dd52b3e19db555fd&format=json&field_list=image,name,description,real_name,aliases,publisher,creators,gender,birth
@JsonSerializable()
class ComicVineCharacterResponse {
  @JsonKey(name: 'results')
  final ComicVineCharacter results;

  @JsonKey(name: 'status_code')
  final int? statusCode;

  ComicVineCharacterResponse(this.results, this.statusCode);

  factory ComicVineCharacterResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicVineCharacterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineCharacterResponseToJson(this);
}

@JsonSerializable()
class ComicVineCharacter {
  @JsonKey(name: 'aliases')
  final String? aliases;

  @JsonKey(name: 'birth')
  final String? birth;

  @JsonKey(name: 'creators')
  final List<ComicVinePersonsItem>? creators;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'gender')
  final int? gender;

  @JsonKey(name: 'image')
  final ComicVineImage? image;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'publisher')
  final ComicVinePublisher? publisher;

  @JsonKey(name: 'real_name')
  final String? realName;

  ComicVineCharacter(this.aliases, this.birth, this.creators, this.description,
      this.gender, this.image, this.name, this.publisher, this.realName);

  factory ComicVineCharacter.fromJson(Map<String, dynamic> json) =>
      _$ComicVineCharacterFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineCharacterToJson(this);
}

// image utility
@JsonSerializable()
class ComicVineImage {
  @JsonKey(name: 'icon_url')
  final String? iconUrl;

  @JsonKey(name: 'medium_url')
  final String? mediumUrl;

  @JsonKey(name: 'screen_url')
  final String? screenUrl;

  @JsonKey(name: 'screen_large_url')
  final String? screenLargeUrl;

  @JsonKey(name: 'small_url')
  final String? smallUrl;

  @JsonKey(name: 'super_url')
  final String? superUrl;

  @JsonKey(name: 'thumb_url')
  final String? thumbUrl;

  @JsonKey(name: 'tiny_url')
  final String? tinyUrl;

  @JsonKey(name: 'original_url')
  final String? originalUrl;

  @JsonKey(name: 'image_tags')
  final String? tags;

  ComicVineImage(
      this.smallUrl,
      this.mediumUrl,
      this.originalUrl,
      this.iconUrl,
      this.screenUrl,
      this.screenLargeUrl,
      this.superUrl,
      this.thumbUrl,
      this.tinyUrl,
      this.tags);

  factory ComicVineImage.fromJson(Map<String, dynamic> json) =>
      _$ComicVineImageFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineImageToJson(this);
}

// characters item utility
@JsonSerializable()
class ComicVineCharactersItem {
  @JsonKey(name: 'api_detail_url')
  final String? apiDetailUrl;

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'site_detail_url')
  final String? siteDetailUrl;

  ComicVineCharactersItem(
      this.apiDetailUrl, this.id, this.name, this.siteDetailUrl);

  factory ComicVineCharactersItem.fromJson(Map<String, dynamic> json) =>
      _$ComicVineCharactersItemFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineCharactersItemToJson(this);
}

// person item utility
@JsonSerializable()
class ComicVinePersonsItem {
  @JsonKey(name: 'api_detail_url')
  final String? apiDetailUrl;

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'site_detail_url')
  final String? siteDetailUrl;

  @JsonKey(name: 'role')
  final String? role;

  ComicVinePersonsItem(
      this.apiDetailUrl, this.id, this.name, this.siteDetailUrl, this.role);

  factory ComicVinePersonsItem.fromJson(Map<String, dynamic> json) =>
      _$ComicVinePersonsItemFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVinePersonsItemToJson(this);
}

// publisher utility
@JsonSerializable()
class ComicVinePublisher {
  @JsonKey(name: 'api_detail_url')
  final String? apiDetailUrl;

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  ComicVinePublisher(this.apiDetailUrl, this.id, this.name);

  factory ComicVinePublisher.fromJson(Map<String, dynamic> json) =>
      _$ComicVinePublisherFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVinePublisherToJson(this);
}

// death utility
@JsonSerializable()
class ComicVinePersonDeath {
  @JsonKey(name: 'date')
  final String? date;

  @JsonKey(name: 'timezone_type')
  final int? timezoneType;

  @JsonKey(name: 'timezone')
  final String? timezone;

  ComicVinePersonDeath(this.date, this.timezoneType, this.timezone);

  factory ComicVinePersonDeath.fromJson(Map<String, dynamic> json) =>
      _$ComicVinePersonDeathFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVinePersonDeathToJson(this);
}
