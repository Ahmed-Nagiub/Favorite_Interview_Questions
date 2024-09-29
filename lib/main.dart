import 'package:favorite_interview_questions_list/bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import 'package:favorite_interview_questions_list/bloc/favorite_bloc/favorite_bloc.dart';
import 'package:favorite_interview_questions_list/bloc/favorite_bloc/favorite_event.dart';
import 'package:favorite_interview_questions_list/view/screens/main_screen/main_screen.dart';
import 'package:favorite_interview_questions_list/view_model/questions_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final questionsViewModel = QuestionsViewModel();

    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavBloc>(create: (context) => BottomNavBloc()),
        BlocProvider<FavoriteBloc>(
          create: (context) => FavoriteBloc(questionsViewModel)..add(LoadFavorites()),
        ),
      ],
      child: MaterialApp(
        title: 'Favorite Interview Questions List',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        home: const MainScreen(),
      ),
    );
  }
}
