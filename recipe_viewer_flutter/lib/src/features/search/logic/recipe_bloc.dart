import 'package:flutter_bloc/flutter_bloc.dart';
import 'recipe_event.dart';
import 'recipe_state.dart';
import '../repository/recipe_repository.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeRepository recipeRepository;

  RecipeBloc(this.recipeRepository) : super(RecipeInitial());

  Stream<RecipeState> mapEventToState(RecipeEvent event) async* {
    if (event is SearchRecipesEvent) {
      yield RecipeLoading();
      try {
        final recipes = await recipeRepository.searchRecipes(event.query);
        yield RecipeLoaded(recipes);
      } catch (e) {
        yield const RecipeError("Failed to fetch recipes");
      }
    }
  }
}
