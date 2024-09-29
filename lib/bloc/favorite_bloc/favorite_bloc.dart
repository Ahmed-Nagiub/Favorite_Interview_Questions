import 'package:favorite_interview_questions_list/bloc/favorite_bloc/favorite_event.dart';
import 'package:favorite_interview_questions_list/bloc/favorite_bloc/favorite_state.dart';
import 'package:favorite_interview_questions_list/view_model/questions_view_model.dart'; // Update this import
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final QuestionsViewModel questionsViewModel;

  FavoriteBloc(this.questionsViewModel) : super(FavoriteInitial()) {
    on<LoadFavorites>((event, emit) async {
      emit(FavoriteLoading());
      try {
        final favoriteList = questionsViewModel.favorites;
        emit(FavoriteLoaded(favoriteList));
      } catch (e) {
        emit(FavoriteError(e.toString()));
      }
    });

    on<AddFavorite>((event, emit) async {
      try {
        final currentState = state;
        if (currentState is FavoriteLoaded) {
          questionsViewModel.addToFavorites(event.question);
          emit(FavoriteLoaded(questionsViewModel.favorites));
        }
      } catch (e) {
        emit(FavoriteError(e.toString()));
      }
    });

    on<RemoveFavorite>((event, emit) async {
      try {
        final currentState = state;
        if (currentState is FavoriteLoaded) {
          questionsViewModel.removeFromFavorites(event.question);
          emit(FavoriteLoaded(questionsViewModel.favorites));
        }
      } catch (e) {
        emit(FavoriteError(e.toString()));
      }
    });
  }
}
