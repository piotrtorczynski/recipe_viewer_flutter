import 'package:recipe_viewer_flutter/src/core/network/network_client.dart';
import '../models/recipe.dart';
import '../network/search_recipes_request.dart';

class RecipeRepository {
  final NetworkClient client;

  RecipeRepository(this.client);

  Future<List<Recipe>> searchRecipes(String query) async {
    final request = SearchRecipesRequest(query);
    return await client.send(request);
  }
}
