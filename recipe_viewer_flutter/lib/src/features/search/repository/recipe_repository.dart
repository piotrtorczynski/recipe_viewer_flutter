import '../models/recipe.dart';

class RecipeRepository {
  Future<List<Recipe>> searchRecipes(String query) async {
    // Simulate API call
    await Future.delayed(Duration(seconds: 2));
    return [
      Recipe(
        label: "Spaghetti Carbonara",
        image: "https://via.placeholder.com/300",
        totalTime: "30 mins",
        cuisineType: ["Italian"],
      ),
    ];
  }
}
