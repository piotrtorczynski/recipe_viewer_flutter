import 'package:flutter/material.dart';

import '../features/search/router/search_router.dart';
import '../features/search/repository/recipe_repository.dart';

class AppRouter {
  final SearchRouter searchRouter;

  AppRouter()
      : searchRouter = SearchRouter(recipeRepository: RecipeRepository());

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    // Ścieżki należące do sekcji przepisów
    if (settings.name == '/' || settings.name?.startsWith('/recipe') == true) {
      return searchRouter.onGenerateRoute(settings);
    }

    // Domyślny fallback dla nieobsługiwanych tras
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(child: Text("Page not found")),
      ),
    );
  }
}
