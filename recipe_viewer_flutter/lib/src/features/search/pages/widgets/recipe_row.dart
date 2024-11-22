import 'package:flutter/material.dart';
import '../../models/recipe.dart';

class RecipeRow extends StatelessWidget {
  final Recipe recipe;

  const RecipeRow({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          Image.network(recipe.image, width: 50, height: 50, fit: BoxFit.cover),
      title: Text(recipe.label),
      subtitle: Text(recipe.totalTime),
      onTap: () {
        Navigator.pushNamed(context, '/recipe/details', arguments: recipe);
      },
    );
  }
}
