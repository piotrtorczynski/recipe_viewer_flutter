import 'package:get_it/get_it.dart';

import '../core/network/network_client.dart';
import '../features/search/data/repositories/recipe_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Rejestracja NetworkClient
  getIt.registerSingleton<NetworkClient>(
    NetworkClient(baseUrl: 'https://api.edamam.com/api'),
  );

  // Rejestracja RecipeRepository z użyciem NetworkClient
  getIt.registerLazySingleton<RecipeRepository>(
    () => RecipeRepository(getIt<NetworkClient>()),
  );

  // Dodaj kolejne zależności w ten sposób:
  // getIt.registerFactory<AuthService>(() => AuthService(getIt<NetworkClient>()));
}
