import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/recipe_bloc.dart';
import '../logic/recipe_event.dart';
import '../logic/recipe_state.dart';
import 'widgets/recipe_row.dart';

class RecipeSearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                context.read<RecipeBloc>().add(SearchRecipesEvent(query));
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<RecipeBloc, RecipeState>(
              builder: (context, state) {
                if (state is RecipeInitial) {
                  return const Center(
                      child: Text("Please use search to find your recipes"));
                } else if (state is RecipeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is RecipeLoaded) {
                  return ListView.builder(
                    itemCount: state.recipes.length,
                    itemBuilder: (context, index) {
                      return RecipeRow(recipe: state.recipes[index]);
                    },
                  );
                } else if (state is RecipeError) {
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
