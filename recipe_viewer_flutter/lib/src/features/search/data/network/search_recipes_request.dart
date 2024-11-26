// ignore_for_file: equal_keys_in_map

import '../../../../core/network/network_request.dart';
import '../models/recipe.dart';

class SearchRecipesRequest extends NetworkRequest<List<Recipe>> {
  final String name;

  SearchRecipesRequest(this.name);

  @override
  String get path => '/recipes/v2';

  @override
  Map<String, dynamic>? get queryParameters => {
        "type": "public",
        "q": name,
        "app_id": "df7edbab",
        "app_key": "088c50c1a294edc63d5ef255b0433f18",
        "imageSize": "THUMBNAIL",
        'field[]': [
          'uri',
          'image',
          'url',
          'ingredients',
          'calories',
          'totalTime',
          'cuisineType'
        ],
      };

  @override
  String get method => 'GET';

  @override
  List<Recipe> parseResponse(Map<String, dynamic> json) {
    final hits = json['hits'] as List<dynamic>;
    return hits.map((hit) {
      final recipeJson = hit['recipe'] as Map<String, dynamic>;
      return Recipe.fromJson(recipeJson);
    }).toList();
  }
}
