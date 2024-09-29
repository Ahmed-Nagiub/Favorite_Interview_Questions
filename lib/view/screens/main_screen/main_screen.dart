import 'package:favorite_interview_questions_list/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:favorite_interview_questions_list/bloc/bottom_nav_bar/bottom_nav_bar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: Scaffold(
        body: BlocBuilder<BottomNavBloc, BottomNavState>(
          builder: (context, state) {
            final bottomNavBloc = context.read<BottomNavBloc>();
            return PageView(
              onPageChanged: (index) => bottomNavBloc.goToPage(index),
              controller: bottomNavBloc.pageController,
              physics: const NeverScrollableScrollPhysics(),
              clipBehavior: Clip.none,
              children: [...bottomNavBloc.pages],
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<BottomNavBloc, BottomNavState>(
          builder: (context, state) {
            return BottomNavigationBar(
              elevation: 2,
              backgroundColor: Colors.grey[300],
              currentIndex: state is FavoriteScreenState ? 0 : 1,
              onTap: (index) => context.read<BottomNavBloc>().goToPage(index),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.question_answer),
                  label: 'Questions',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.star_border_outlined),
                  label: 'Favorites',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

