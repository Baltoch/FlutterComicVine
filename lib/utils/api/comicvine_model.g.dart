// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comicvine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicVineIssuesResponse _$ComicVineIssuesResponseFromJson(
        Map<String, dynamic> json) =>
    ComicVineIssuesResponse(
      (json['results'] as List<dynamic>)
          .map((e) => ComicVineIssuesItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['number_of_total_results'] as int,
      json['status_code'] as int,
    );

Map<String, dynamic> _$ComicVineIssuesResponseToJson(
        ComicVineIssuesResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'number_of_total_results': instance.total,
      'status_code': instance.statusCode,
    };

ComicVineIssuesItem _$ComicVineIssuesItemFromJson(Map<String, dynamic> json) =>
    ComicVineIssuesItem(
      json['name'] as String?,
      json['issue_number'] as String?,
      json['image'] == null
          ? null
          : ComicVineImage.fromJson(json['image'] as Map<String, dynamic>),
      json['volume'] == null
          ? null
          : ComicVineVolume.fromJson(json['volume'] as Map<String, dynamic>),
      json['cover_date'] as String?,
      json['id'] as int?,
    );

Map<String, dynamic> _$ComicVineIssuesItemToJson(
        ComicVineIssuesItem instance) =>
    <String, dynamic>{
      'cover_date': instance.coverDate,
      'id': instance.id,
      'image': instance.image,
      'issue_number': instance.issueNumber,
      'name': instance.name,
      'volume': instance.volume,
    };

ComicVineVolume _$ComicVineVolumeFromJson(Map<String, dynamic> json) =>
    ComicVineVolume(
      json['api_detail_url'] as String?,
      json['id'] as int?,
      json['name'] as String?,
      json['site_detail_url'] as String?,
    );

Map<String, dynamic> _$ComicVineVolumeToJson(ComicVineVolume instance) =>
    <String, dynamic>{
      'api_detail_url': instance.apiDetailUrl,
      'id': instance.id,
      'name': instance.name,
      'site_detail_url': instance.siteDetailUrl,
    };

ComicVineIssueResponse _$ComicVineIssueResponseFromJson(
        Map<String, dynamic> json) =>
    ComicVineIssueResponse(
      json['status_code'] as int?,
      ComicVineIssue.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicVineIssueResponseToJson(
        ComicVineIssueResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'results': instance.results,
    };

ComicVineIssue _$ComicVineIssueFromJson(Map<String, dynamic> json) =>
    ComicVineIssue(
      (json['character_credits'] as List<dynamic>?)
          ?.map((e) =>
              ComicVineCharactersItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['cover_date'] as String?,
      json['description'] as String?,
      json['image'] == null
          ? null
          : ComicVineImage.fromJson(json['image'] as Map<String, dynamic>),
      json['issue_number'] as String?,
      json['name'] as String?,
      (json['person_credits'] as List<dynamic>?)
          ?.map((e) => ComicVinePersonsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['volume'] == null
          ? null
          : ComicVineVolume.fromJson(json['volume'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicVineIssueToJson(ComicVineIssue instance) =>
    <String, dynamic>{
      'character_credits': instance.characters,
      'cover_date': instance.coverDate,
      'description': instance.description,
      'image': instance.image,
      'issue_number': instance.issueNumber,
      'name': instance.name,
      'person_credits': instance.persons,
      'volume': instance.volume,
    };

ComicVineMoviesResponse _$ComicVineMoviesResponseFromJson(
        Map<String, dynamic> json) =>
    ComicVineMoviesResponse(
      (json['results'] as List<dynamic>)
          .map((e) => ComicVineMoviesItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['number_of_total_results'] as int,
      json['status_code'] as int,
    );

Map<String, dynamic> _$ComicVineMoviesResponseToJson(
        ComicVineMoviesResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'number_of_total_results': instance.total,
      'status_code': instance.statusCode,
    };

ComicVineMoviesItem _$ComicVineMoviesItemFromJson(Map<String, dynamic> json) =>
    ComicVineMoviesItem(
      json['api_detail_url'] as String?,
      json['date_added'] as String?,
      json['id'] as int?,
      json['image'] == null
          ? null
          : ComicVineImage.fromJson(json['image'] as Map<String, dynamic>),
      json['name'] as String?,
      json['runtime'] as String?,
    );

Map<String, dynamic> _$ComicVineMoviesItemToJson(
        ComicVineMoviesItem instance) =>
    <String, dynamic>{
      'api_detail_url': instance.apiDetailUrl,
      'date_added': instance.dateAdded,
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'runtime': instance.runtime,
    };

ComicVineMovieResponse _$ComicVineMovieResponseFromJson(
        Map<String, dynamic> json) =>
    ComicVineMovieResponse(
      json['status_code'] as int?,
      ComicVineMovie.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicVineMovieResponseToJson(
        ComicVineMovieResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'results': instance.results,
    };

ComicVineMovie _$ComicVineMovieFromJson(Map<String, dynamic> json) =>
    ComicVineMovie(
      json['box_office_revenue'] as String?,
      json['budget'] as String?,
      (json['characters'] as List<dynamic>?)
          ?.map((e) =>
              ComicVineCharactersItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['date_added'] as String?,
      json['description'] as String?,
      json['image'] == null
          ? null
          : ComicVineImage.fromJson(json['image'] as Map<String, dynamic>),
      json['name'] as String?,
      (json['producers'] as List<dynamic>?)
          ?.map((e) => ComicVinePersonsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['rating'] as String?,
      json['runtime'] as String?,
      (json['studios'] as List<dynamic>?)
          ?.map((e) => ComicVineStudio.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total_revenue'] as String?,
      (json['writers'] as List<dynamic>?)
          ?.map((e) => ComicVinePersonsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicVineMovieToJson(ComicVineMovie instance) =>
    <String, dynamic>{
      'box_office_revenue': instance.boxOfficeRevenue,
      'budget': instance.budget,
      'characters': instance.characters,
      'date_added': instance.dateAdded,
      'description': instance.description,
      'image': instance.image,
      'name': instance.name,
      'producers': instance.producers,
      'rating': instance.rating,
      'runtime': instance.runtime,
      'studios': instance.studios,
      'total_revenue': instance.totalRevenue,
      'writers': instance.writers,
    };

ComicVineStudio _$ComicVineStudioFromJson(Map<String, dynamic> json) =>
    ComicVineStudio(
      json['api_detail_url'] as String?,
      json['id'] as int?,
      json['name'] as String?,
      json['site_detail_url'] as String?,
    );

Map<String, dynamic> _$ComicVineStudioToJson(ComicVineStudio instance) =>
    <String, dynamic>{
      'api_detail_url': instance.apiDetailUrl,
      'id': instance.id,
      'name': instance.name,
      'site_detail_url': instance.siteDetailUrl,
    };

ComicVineSeriesListResponse _$ComicVineSeriesListResponseFromJson(
        Map<String, dynamic> json) =>
    ComicVineSeriesListResponse(
      (json['results'] as List<dynamic>)
          .map((e) => ComicVineSeriesItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['number_of_total_results'] as int,
      json['status_code'] as int,
    );

Map<String, dynamic> _$ComicVineSeriesListResponseToJson(
        ComicVineSeriesListResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'number_of_total_results': instance.total,
      'status_code': instance.statusCode,
    };

ComicVineSeriesItem _$ComicVineSeriesItemFromJson(Map<String, dynamic> json) =>
    ComicVineSeriesItem(
      json['count_of_episodes'] as int?,
      json['id'] as int?,
      json['image'] == null
          ? null
          : ComicVineImage.fromJson(json['image'] as Map<String, dynamic>),
      json['name'] as String?,
      json['publisher'] == null
          ? null
          : ComicVinePublisher.fromJson(
              json['publisher'] as Map<String, dynamic>),
      json['start_year'] as String?,
    );

Map<String, dynamic> _$ComicVineSeriesItemToJson(
        ComicVineSeriesItem instance) =>
    <String, dynamic>{
      'count_of_episodes': instance.countOfEpisodes,
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'publisher': instance.publisher,
      'start_year': instance.startYear,
    };

ComicVineSeriesResponse _$ComicVineSeriesResponseFromJson(
        Map<String, dynamic> json) =>
    ComicVineSeriesResponse(
      json['status_code'] as int?,
      ComicVineSeries.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicVineSeriesResponseToJson(
        ComicVineSeriesResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'results': instance.results,
    };

ComicVineSeries _$ComicVineSeriesFromJson(Map<String, dynamic> json) =>
    ComicVineSeries(
      (json['characters'] as List<dynamic>?)
          ?.map((e) =>
              ComicVineCharactersItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['count_of_episodes'] as int?,
      json['description'] as String?,
      (json['episodes'] as List<dynamic>?)
          ?.map(
              (e) => ComicVineEpisodesItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['image'] == null
          ? null
          : ComicVineImage.fromJson(json['image'] as Map<String, dynamic>),
      json['name'] as String?,
      json['publisher'] == null
          ? null
          : ComicVinePublisher.fromJson(
              json['publisher'] as Map<String, dynamic>),
      json['start_year'] as String?,
    );

Map<String, dynamic> _$ComicVineSeriesToJson(ComicVineSeries instance) =>
    <String, dynamic>{
      'characters': instance.characters,
      'count_of_episodes': instance.countOfEpisodes,
      'description': instance.description,
      'episodes': instance.episodes,
      'image': instance.image,
      'name': instance.name,
      'publisher': instance.publisher,
      'start_year': instance.startYear,
    };

ComicVineEpisodesItem _$ComicVineEpisodesItemFromJson(
        Map<String, dynamic> json) =>
    ComicVineEpisodesItem(
      json['api_detail_url'] as String?,
      json['id'] as int?,
      json['name'] as String?,
      json['site_detail_url'] as String?,
      json['episode_number'] as String?,
    );

Map<String, dynamic> _$ComicVineEpisodesItemToJson(
        ComicVineEpisodesItem instance) =>
    <String, dynamic>{
      'api_detail_url': instance.apiDetailUrl,
      'id': instance.id,
      'name': instance.name,
      'site_detail_url': instance.siteDetailUrl,
      'episode_number': instance.episodeNumber,
    };

ComicVineEpisodeResponse _$ComicVineEpisodeResponseFromJson(
        Map<String, dynamic> json) =>
    ComicVineEpisodeResponse(
      json['status_code'] as int?,
      ComicVineEpisode.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicVineEpisodeResponseToJson(
        ComicVineEpisodeResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'results': instance.results,
    };

ComicVineEpisode _$ComicVineEpisodeFromJson(Map<String, dynamic> json) =>
    ComicVineEpisode(
      json['air_date'] as String?,
      json['episode_number'] as String?,
      json['image'] == null
          ? null
          : ComicVineImage.fromJson(json['image'] as Map<String, dynamic>),
      json['name'] as String?,
    );

Map<String, dynamic> _$ComicVineEpisodeToJson(ComicVineEpisode instance) =>
    <String, dynamic>{
      'air_date': instance.airDate,
      'episode_number': instance.episodeNumber,
      'image': instance.image,
      'name': instance.name,
    };

ComicVinePersonResponse _$ComicVinePersonResponseFromJson(
        Map<String, dynamic> json) =>
    ComicVinePersonResponse(
      json['status_code'] as int?,
      ComicVinePerson.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicVinePersonResponseToJson(
        ComicVinePersonResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'results': instance.results,
    };

ComicVinePerson _$ComicVinePersonFromJson(Map<String, dynamic> json) =>
    ComicVinePerson(
      json['aliases'] as String?,
      json['birth'] as String?,
      json['country'] as String?,
      json['death'] == null
          ? null
          : ComicVinePersonDeath.fromJson(
              json['death'] as Map<String, dynamic>),
      json['deck'] as String?,
      json['description'] as String?,
      json['gender'] as int?,
      json['hometown'] as String?,
      json['image'] == null
          ? null
          : ComicVineImage.fromJson(json['image'] as Map<String, dynamic>),
      json['name'] as String?,
      json['website'] as String?,
    );

Map<String, dynamic> _$ComicVinePersonToJson(ComicVinePerson instance) =>
    <String, dynamic>{
      'aliases': instance.aliases,
      'birth': instance.birth,
      'country': instance.country,
      'death': instance.death,
      'deck': instance.deck,
      'description': instance.description,
      'gender': instance.gender,
      'hometown': instance.hometown,
      'image': instance.image,
      'name': instance.name,
      'website': instance.website,
    };

ComicVineCharactersResponse _$ComicVineCharactersResponseFromJson(
        Map<String, dynamic> json) =>
    ComicVineCharactersResponse(
      (json['results'] as List<dynamic>)
          .map((e) =>
              ComicVineCharactersItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['status_code'] as int?,
    );

Map<String, dynamic> _$ComicVineCharactersResponseToJson(
        ComicVineCharactersResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'status_code': instance.statusCode,
    };

ComicVineCharactersItems _$ComicVineCharactersItemsFromJson(
        Map<String, dynamic> json) =>
    ComicVineCharactersItems(
      json['api_detail_url'] as String?,
      json['id'] as int?,
      json['name'] as String?,
      json['site_detail_url'] as String?,
      json['image'] == null
          ? null
          : ComicVineImage.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicVineCharactersItemsToJson(
        ComicVineCharactersItems instance) =>
    <String, dynamic>{
      'api_detail_url': instance.apiDetailUrl,
      'id': instance.id,
      'name': instance.name,
      'site_detail_url': instance.siteDetailUrl,
      'image': instance.image,
    };

ComicVineCharacterResponse _$ComicVineCharacterResponseFromJson(
        Map<String, dynamic> json) =>
    ComicVineCharacterResponse(
      ComicVineCharacter.fromJson(json['results'] as Map<String, dynamic>),
      json['status_code'] as int?,
    );

Map<String, dynamic> _$ComicVineCharacterResponseToJson(
        ComicVineCharacterResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'status_code': instance.statusCode,
    };

ComicVineCharacter _$ComicVineCharacterFromJson(Map<String, dynamic> json) =>
    ComicVineCharacter(
      json['aliases'] as String?,
      json['birth'] as String?,
      (json['creators'] as List<dynamic>?)
          ?.map((e) => ComicVinePersonsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['description'] as String?,
      json['gender'] as int?,
      json['image'] == null
          ? null
          : ComicVineImage.fromJson(json['image'] as Map<String, dynamic>),
      json['name'] as String?,
      json['publisher'] == null
          ? null
          : ComicVinePublisher.fromJson(
              json['publisher'] as Map<String, dynamic>),
      json['real_name'] as String?,
    );

Map<String, dynamic> _$ComicVineCharacterToJson(ComicVineCharacter instance) =>
    <String, dynamic>{
      'aliases': instance.aliases,
      'birth': instance.birth,
      'creators': instance.creators,
      'description': instance.description,
      'gender': instance.gender,
      'image': instance.image,
      'name': instance.name,
      'publisher': instance.publisher,
      'real_name': instance.realName,
    };

ComicVineImage _$ComicVineImageFromJson(Map<String, dynamic> json) =>
    ComicVineImage(
      json['small_url'] as String?,
      json['medium_url'] as String?,
      json['original_url'] as String?,
      json['icon_url'] as String?,
      json['screen_url'] as String?,
      json['screen_large_url'] as String?,
      json['super_url'] as String?,
      json['thumb_url'] as String?,
      json['tiny_url'] as String?,
      json['image_tags'] as String?,
    );

Map<String, dynamic> _$ComicVineImageToJson(ComicVineImage instance) =>
    <String, dynamic>{
      'icon_url': instance.iconUrl,
      'medium_url': instance.mediumUrl,
      'screen_url': instance.screenUrl,
      'screen_large_url': instance.screenLargeUrl,
      'small_url': instance.smallUrl,
      'super_url': instance.superUrl,
      'thumb_url': instance.thumbUrl,
      'tiny_url': instance.tinyUrl,
      'original_url': instance.originalUrl,
      'image_tags': instance.tags,
    };

ComicVineCharactersItem _$ComicVineCharactersItemFromJson(
        Map<String, dynamic> json) =>
    ComicVineCharactersItem(
      json['api_detail_url'] as String?,
      json['id'] as int?,
      json['name'] as String?,
      json['site_detail_url'] as String?,
    );

Map<String, dynamic> _$ComicVineCharactersItemToJson(
        ComicVineCharactersItem instance) =>
    <String, dynamic>{
      'api_detail_url': instance.apiDetailUrl,
      'id': instance.id,
      'name': instance.name,
      'site_detail_url': instance.siteDetailUrl,
    };

ComicVinePersonsItem _$ComicVinePersonsItemFromJson(
        Map<String, dynamic> json) =>
    ComicVinePersonsItem(
      json['api_detail_url'] as String?,
      json['id'] as int?,
      json['name'] as String?,
      json['site_detail_url'] as String?,
      json['role'] as String?,
    );

Map<String, dynamic> _$ComicVinePersonsItemToJson(
        ComicVinePersonsItem instance) =>
    <String, dynamic>{
      'api_detail_url': instance.apiDetailUrl,
      'id': instance.id,
      'name': instance.name,
      'site_detail_url': instance.siteDetailUrl,
      'role': instance.role,
    };

ComicVinePublisher _$ComicVinePublisherFromJson(Map<String, dynamic> json) =>
    ComicVinePublisher(
      json['api_detail_url'] as String?,
      json['id'] as int?,
      json['name'] as String?,
    );

Map<String, dynamic> _$ComicVinePublisherToJson(ComicVinePublisher instance) =>
    <String, dynamic>{
      'api_detail_url': instance.apiDetailUrl,
      'id': instance.id,
      'name': instance.name,
    };

ComicVinePersonDeath _$ComicVinePersonDeathFromJson(
        Map<String, dynamic> json) =>
    ComicVinePersonDeath(
      json['date'] as String?,
      json['timezone_type'] as int?,
      json['timezone'] as String?,
    );

Map<String, dynamic> _$ComicVinePersonDeathToJson(
        ComicVinePersonDeath instance) =>
    <String, dynamic>{
      'date': instance.date,
      'timezone_type': instance.timezoneType,
      'timezone': instance.timezone,
    };
