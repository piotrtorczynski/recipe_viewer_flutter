import 'package:flutter_bloc/flutter_bloc.dart';
import 'recipe_event.dart';
import 'recipe_state.dart';
import '../../data/repositories/recipe_repository.dart';
import '../../../../dependency_injection/dependency_injection.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final repository = getIt<RecipeRepository>();

  RecipeBloc() : super(RecipeLoadingState()) {
    on<SearchRecipesEvent>((event, emit) async {
      try {
        final recipes = await repository.searchRecipes(event.query);
        emit(RecipeLoadedState(recipes));
      } catch (e) {
        emit(RecipeErrorState(e.toString()));
      }
    });
  }
}
