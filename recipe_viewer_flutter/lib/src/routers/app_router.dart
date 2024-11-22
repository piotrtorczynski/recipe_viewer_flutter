import 'package:flutter/material.dart';

import '../features/search/router/search_router.dart';
import '../features/search/repository/recipe_repository.dart';

class AppRouter {
  final SearchRouter recipeRouter;

  AppRouter()
      : recipeRouter = SearchRouter(recipeRepository: RecipeRepository());

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name?.startsWith('/recipe') == true) {
      return recipeRouter.onGenerateRoute(settings);
    }

    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(child: Text("Page not found")),
      ),
    );
  }
}
