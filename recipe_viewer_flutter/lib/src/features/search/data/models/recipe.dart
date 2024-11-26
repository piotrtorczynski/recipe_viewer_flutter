class Recipe {
  final String label;
  final String image;
  final String url;
  final List<Ingredient> ingredients;
  final double calories;
  final double? totalTime;
  final List<String>? cuisineType;

  Recipe({
    required this.label,
    required this.image,
    required this.url,
    required this.ingredients,
    required this.calories,
    this.totalTime,
    this.cuisineType,
  });

  // Konwersja JSON na obiekt RecipeDTO
  factory Recipe.fromJson(Map<String, dynamic> json) {
    var ingredientsJson = json['ingredients'] as List;
    List<Ingredient> ingredientsList =
        ingredientsJson.map((e) => Ingredient.fromJson(e)).toList();

    return Recipe(
      label: json['label'],
      image: json['image'],
      url: json['url'],
      ingredients: ingredientsList,
      calories: json['calories'].toDouble(),
      totalTime:
          // ignore: prefer_null_aware_operators
          json['totalTime'] != null ? json['totalTime'].toDouble() : null,
      cuisineType: json['cuisineType'] != null
          ? List<String>.from(json['cuisineType'])
          : null,
    );
  }
}

class Ingredient {
  final double quantity;
  final String? measure;
  final String food;
  final double weight;
  final String? foodCategory;
  final String? image;

  Ingredient({
    required this.quantity,
    this.measure,
    required this.food,
    required this.weight,
    this.foodCategory,
    this.image,
  });

  // Konwersja JSON na obiekt IngredientDTO
  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      quantity: json['quantity'].toDouble(),
      measure: json['measure'],
      food: json['food'],
      weight: json['weight'].toDouble(),
      foodCategory: json['foodCategory'],
      image: json['image'],
    );
  }
}

class RecipeResponse {
  final List<RecipeHit> hits;

  RecipeResponse({required this.hits});

  // Konwersja JSON na obiekt RecipeResponseDTO
  factory RecipeResponse.fromJson(Map<String, dynamic> json) {
    var hitsJson = json['hits'] as List;
    List<RecipeHit> hitsList =
        hitsJson.map((e) => RecipeHit.fromJson(e)).toList();

    return RecipeResponse(hits: hitsList);
  }
}

class RecipeHit {
  final Recipe recipe;

  RecipeHit({required this.recipe});

  // Konwersja JSON na obiekt RecipeHitDTO
  factory RecipeHit.fromJson(Map<String, dynamic> json) {
    return RecipeHit(
      recipe: Recipe.fromJson(json['recipe']),
    );
  }
}
