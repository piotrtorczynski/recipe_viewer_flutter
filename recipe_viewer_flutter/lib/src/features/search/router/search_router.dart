import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation/bloc/recipe_bloc.dart';
import '../data/models/recipe.dart';
import '../presentation/pages/recipe_search_view.dart';
import '../presentation/pages/recipe_detail_view.dart';
import '../data/repositories/recipe_repository.dart';
import '../../../dependency_injection/dependency_injection.dart';

class SearchRouter {
  final recipeRepository = getIt<RecipeRepository>();

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Ścieżka domyślna (startowa)
      case '/':
      case '/recipe':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => RecipeBloc(),
            child: const RecipeSearchView(),
          ),
        );

      // Szczegóły przepisu
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
        return null; // Pozwól AppRouter obsłużyć inne trasy
    }
  }
}
