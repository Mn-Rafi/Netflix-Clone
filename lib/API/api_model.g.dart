// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trending _$TrendingFromJson(Map<String, dynamic> json) => Trending(
      image: json['poster_path'] as String,
    );

Map<String, dynamic> _$TrendingToJson(Trending instance) => <String, dynamic>{
      'poster_path': instance.image,
    };

Upcoming _$UpcomingFromJson(Map<String, dynamic> json) => Upcoming(
      image: json['poster_path'] as String,
      date: json['release_date'] as String,
      title: json['title'] as String,
      overview: json['overview'] as String,
    );

Map<String, dynamic> _$UpcomingToJson(Upcoming instance) => <String, dynamic>{
      'poster_path': instance.image,
      'title': instance.title,
      'release_date': instance.date,
      'overview': instance.overview,
    };
