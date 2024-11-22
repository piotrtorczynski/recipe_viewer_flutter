import 'package:equatable/equatable.dart';

abstract class RecipeEvent extends Equatable {
  const RecipeEvent();

  @override
  List<Object?> get props => [];
}

class SearchRecipesEvent extends RecipeEvent {
  final String query;

  const SearchRecipesEvent(this.query);

  @override
  List<Object?> get props => [query];
}
