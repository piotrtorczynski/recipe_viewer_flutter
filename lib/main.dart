import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

import 'src/features/search/presentation/bloc/recipe_bloc.dart';
import 'src/routers/app_router.dart';
import 'src/dependency_injection/dependency_injection.dart';
import 'src/core/network/proxy/proxy_http_overrides.dart';

void main() {
  const isDev = bool.fromEnvironment('dart.vm.product') == false;

  if (isDev) {
    HttpOverrides.global = ProxyHttpOverrides(
        "localhost:9090"); // ProxyMan używa domyślnie tego portu
  }
  setupDependencies();
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
          create: (context) => RecipeBloc(),
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
