import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/features/search/logic/recipe_bloc.dart';
import 'src/features/search/repository/recipe_repository.dart';
import 'src/routers/app_router.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  RecipeApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Udostępniamy RecipeBloc w hierarchii widgetów
        BlocProvider(
          create: (context) => RecipeBloc(RecipeRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'Recipe Viewer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
