import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/recipe_bloc.dart';
import '../bloc/recipe_event.dart';
import '../bloc/recipe_state.dart';
import '../widgets/recipe_row.dart';

class RecipeSearchView extends StatelessWidget {
  const RecipeSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeBloc = BlocProvider.of<RecipeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipes"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Look for a recipe",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onSubmitted: (query) {
                recipeBloc.add(SearchRecipesEvent(query));
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<RecipeBloc, RecipeState>(
              builder: (context, state) {
                if (state is RecipeLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is RecipeLoadedState) {
                  return ListView.builder(
                    itemCount: state.recipes.length,
                    itemBuilder: (context, index) {
                      return RecipeRow(recipe: state.recipes[index]);
                    },
                  );
                } else if (state is RecipeErrorState) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
