import 'package:favorite_interview_questions_list/view/screens/favorite_screen/favorite_screen.dart';
import 'package:favorite_interview_questions_list/view/screens/question_list_screen/question_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bottom_nav_bar_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  final PageController pageController = PageController(initialPage: 0);

  BottomNavBloc() : super(FavoriteScreenState()) {
    on<ShowFavoriteScreen>((event, emit) {
      emit(FavoriteScreenState());
      pageController.jumpToPage(0);
    });

    on<ShowQuestionListScreen>((event, emit) {
      emit(QuestionListScreenState());
      pageController.jumpToPage(1);
    });
  }

  List<Widget> pages = [
    const QuestionsListScreen(),
    const FavoriteScreen(),
  ];

  void goToPage(int index) {
    if (index == 0) {
      add(ShowFavoriteScreen());
    } else {
      add(ShowQuestionListScreen());
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
