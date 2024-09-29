import 'package:favorite_interview_questions_list/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:favorite_interview_questions_list/bloc/favorite_bloc/favorite_event.dart';
import 'package:favorite_interview_questions_list/bloc/favorite_bloc/favorite_state.dart';
import 'package:favorite_interview_questions_list/widget/custom_appbar.dart';
import 'package:favorite_interview_questions_list/widget/custom_snackbar.dart';
import 'package:favorite_interview_questions_list/widget/question_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionsListScreen extends StatelessWidget {
  const QuestionsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<FavoriteBloc>().add(LoadFavorites());
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: customAppBar('Questions List'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FavoriteLoaded) {
              final questions = context.read<FavoriteBloc>().questionsViewModel.questions;
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  final isFavorite = state.favoriteQuestions.contains(question.question);
                  return QuestionCard(
                    question: question.question,
                    isFavorite: isFavorite,
                    onFavoriteToggle: () {
                      if (isFavorite) {
                        context.read<FavoriteBloc>().add(RemoveFavorite(question.question));
                        showCustomSnackBar(
                          'Question removed from favorites.',
                          context,
                          isError: false,
                        );
                      } else {
                        context.read<FavoriteBloc>().add(AddFavorite(question.question));
                        showCustomSnackBar(
                          'Question added  to favorites.',
                          context,
                          isError: false,
                        );
                      }
                    },
                  );
                },
              );
            } else if (state is FavoriteError) {
              return Center(child: Text(state.error));
            } else {
              return const Center(child: Text('No questions available.'));
            }
          },
        ),
      ),
    );
  }
}
