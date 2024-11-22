class Recipe {
  final String label;
  final String image;
  final String totalTime;
  final List<String>? cuisineType;

  Recipe({
    required this.label,
    required this.image,
    required this.totalTime,
    this.cuisineType,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      label: json['label'],
      image: json['image'],
      totalTime: json['totalTime'],
      cuisineType: List<String>.from(json['cuisineType'] ?? []),
    );
  }
}
