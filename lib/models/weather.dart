import 'package:collection/collection.dart';
import 'review.dart';

class weather {
  final double tempC;
  final double tempF;
  final double feelsLikeC;
  final double feelsLikeF;
  final double windKph;
  final double windMph;
  final double humidity;
  final int uv;
  final List<Review> reviews;

  weather({
    required this.tempC,
    required this.tempF,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.windKph,
    required this.windMph,
    required this.humidity,
    required this.uv,
    required this.reviews,
  });

  factory weather.fromJson(Map<String, dynamic> json) {
    List<Review> reviews =
    json['reviews'].map<Review>((item) => Review.fromJson(item)).toList();
    var averageRating = 0.0;
    if (reviews.isNotEmpty) {
      //averageRating = reviews.map((review) => review.rating).average;
    }

    return weather(
      tempC: json['tempC'],
      tempF: json['tempF'],
      feelsLikeC: json['feelsLikeC'],
      feelsLikeF: json['feelsLikeF'],
      windKph: json['windKph'],
      windMph: json['windMph'],
      humidity: json['humidity'],
      uv: json['uv'],
      reviews: reviews,
    );
  }
}
