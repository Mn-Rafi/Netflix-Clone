import 'package:json_annotation/json_annotation.dart';
part 'api_model.g.dart';

@JsonSerializable()
class Trending {
  @JsonKey(name: "poster_path")
  final String image;

  Trending({required this.image});

  factory Trending.fromJson(Map<String, dynamic> json) {
    return _$TrendingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TrendingToJson(this);
}

@JsonSerializable()
class Upcoming {
  @JsonKey(name: "poster_path")
  final String image;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "release_date")
  final String date;

  @JsonKey(name: "overview")
  final String overview;

  Upcoming({required this.image, required this.date, required this.title, required this.overview});

  factory Upcoming.fromJson(Map<String, dynamic> json) {
    return _$UpcomingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpcomingToJson(this);
}