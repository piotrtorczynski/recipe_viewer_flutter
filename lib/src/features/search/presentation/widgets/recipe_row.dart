import 'package:flutter/material.dart';
import '../../data/models/recipe.dart';

class RecipeRow extends StatelessWidget {
  final Recipe recipe;

  const RecipeRow({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          Image.network(recipe.image, width: 50, height: 50, fit: BoxFit.cover),
      title: Text(recipe.label),
      subtitle: Text(recipe.totalTime.toString()),
      onTap: () {
        Navigator.pushNamed(context, '/recipe/details', arguments: recipe);
      },
    );
  }
}
