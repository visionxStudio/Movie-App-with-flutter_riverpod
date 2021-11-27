import 'package:get_it/get_it.dart';
import 'package:movieapp/src/models/app_config.dart';

class Movie {
  final String name;
  final String language;
  final bool isAdult;
  final String discription;
  final String posterPath;
  final String backdropPath;
  final num rating;
  final String releaseDate;

  Movie({
    required this.name,
    required this.language,
    required this.isAdult,
    required this.discription,
    required this.posterPath,
    required this.backdropPath,
    required this.rating,
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> map) {
    return Movie(
      name: map['title'],
      language: map['original_language'],
      isAdult: map['adult'],
      discription: map['overview'],
      posterPath: map['poster_path'],
      backdropPath: map['backdrop_path'],
      rating: map['vote_average'],
      releaseDate: map['release_date'],
    );
  }

  String posterUrl() {
    final AppConfig _appConfig = GetIt.instance.get<AppConfig>();
    return '${_appConfig.baseImageApiUrl}/$posterPath';
  }
}
