import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/recipe_bloc.dart';
import '../models/recipe.dart';
import '../pages/recipe_search_view.dart';
import '../pages/recipe_detail_view.dart';
import '../repository/recipe_repository.dart';

class SearchRouter {
  final RecipeRepository recipeRepository;

  SearchRouter({required this.recipeRepository});

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/recipe':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => RecipeBloc(recipeRepository),
            child: RecipeSearchView(),
          ),
        );

      case '/recipe/details':
        final recipe = settings.arguments;
        if (recipe is Recipe) {
          return MaterialPageRoute(
            builder: (_) => RecipeDetailView(recipe: recipe),
          );
        } else {
          return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(child: Text("Recipe not found")),
            ),
          );
        }

      default:
        return null;
    }
  }
}
