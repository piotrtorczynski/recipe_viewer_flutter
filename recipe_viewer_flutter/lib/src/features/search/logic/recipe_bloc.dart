import 'package:flutter_bloc/flutter_bloc.dart';
import 'recipe_event.dart';
import 'recipe_state.dart';
import '../repository/recipe_repository.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeRepository recipeRepository;

  RecipeBloc(this.recipeRepository) : super(RecipeInitialState()) {
    // Obsługa zdarzenia SearchRecipesEvent
    on<SearchRecipesEvent>((event, emit) async {
      emit(RecipeLoadingState()); // Emitujemy stan ładowania
      try {
        final recipes = await recipeRepository.searchRecipes(event.query);
        emit(RecipeLoadedState(recipes)); // Emitujemy stan z wynikami
      } catch (e) {
        emit(RecipeErrorState(e.toString())); // Emitujemy stan błędu
      }
    });
  }
}
