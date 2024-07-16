import 'dart:convert';

import 'package:peliculas/models/models.dart';

class PopularResponse {
  int? page;
  List<Result> results;
  int? totalPages;
  int? totalResults;

  PopularResponse({
    this.page,
    required this.results,
    this.totalPages,
    this.totalResults,
  });

  factory PopularResponse.fromRawJson(String str) =>
      PopularResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PopularResponse.fromJson(Map<String, dynamic> json) =>
      PopularResponse(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
