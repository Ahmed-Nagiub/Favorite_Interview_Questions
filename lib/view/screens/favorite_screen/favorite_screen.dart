import 'package:favorite_interview_questions_list/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:favorite_interview_questions_list/bloc/favorite_bloc/favorite_event.dart';
import 'package:favorite_interview_questions_list/bloc/favorite_bloc/favorite_state.dart';
import 'package:favorite_interview_questions_list/widget/custom_appbar.dart';
import 'package:favorite_interview_questions_list/widget/custom_snackbar.dart';
import 'package:favorite_interview_questions_list/widget/question_card.dart';
import 'package:favorite_interview_questions_list/widget/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Favorite List'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FavoriteLoaded) {
              final favorites = state.favoriteQuestions;
              if (favorites.isEmpty) {
                return const Center(
                  child: TextUtils(text: 'No favorite questions yet!'),
                );
              }
              return ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return QuestionCard(
                    question: favorites[index],
                    isFavorite: true,
                    onFavoriteToggle: () {
                      context.read<FavoriteBloc>().add(RemoveFavorite(favorites[index]));
                      showCustomSnackBar(
                        'Question removed from favorites.',
                        context,
                        isError: false,
                      );
                    },
                  );
                },
              );
            } else if (state is FavoriteError) {
              return Center(child: Text('Error: ${state.error}'));
            }
            return const Center(child: Text('Something went wrong'));
          },
        ),
      ),
    );
  }
}
