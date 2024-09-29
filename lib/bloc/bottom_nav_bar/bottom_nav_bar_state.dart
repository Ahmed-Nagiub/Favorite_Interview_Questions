abstract class BottomNavEvent {}

class ShowFavoriteScreen extends BottomNavEvent {}

class ShowQuestionListScreen extends BottomNavEvent {}


abstract class BottomNavState {}

class FavoriteScreenState extends BottomNavState {}

class QuestionListScreenState extends BottomNavState {}
