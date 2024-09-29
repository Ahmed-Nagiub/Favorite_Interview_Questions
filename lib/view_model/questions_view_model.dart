import 'package:favorite_interview_questions_list/data/models/question_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionsViewModel {
  final List<QuestionModel> questions = [
    QuestionModel('What is Flutter?'),
    QuestionModel('Explain the difference between StatefulWidget and StatelessWidget?'),
    QuestionModel('What is the use of setState in Flutter?'),
    QuestionModel('How does Flutter handle widget rendering?'),
    QuestionModel('What is an InheritedWidget?'),
    QuestionModel('Explain the use of the BuildContext in Flutter?'),
    QuestionModel('What is the difference between Hot Reload and Hot Restart in Flutter?'),
    QuestionModel('How do you manage state in Flutter?'),
    QuestionModel('What is a Future in Dart?'),
    QuestionModel('Explain the use of async and await in Dart?'),
    QuestionModel('What are streams in Dart and how do they work?'),
    QuestionModel('How do you handle errors in Flutter?'),
    QuestionModel('What is the role of the pubspec.yaml file in Flutter?'),
    QuestionModel('How do you manage navigation in Flutter?'),
    QuestionModel('What is the use of the Navigator in Flutter?'),
    QuestionModel('What are some common performance optimizations in Flutter?'),
    QuestionModel('Explain how to use ListView and GridView in Flutter?'),
    QuestionModel('How do you handle gestures in Flutter?'),
    QuestionModel('How do you implement animations in Flutter?'),
    QuestionModel('What is the use of the Provider package in Flutter?'),
  ];

  List<String> _favorites = [];
  late SharedPreferences _sharedPreferences;

  QuestionsViewModel() {
    _loadFavorites();
  }

  List<String> get favorites => _favorites;

  Future<void> _loadFavorites() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _favorites = _sharedPreferences.getStringList('favorites') ?? [];
  }

  void addToFavorites(String question) {
    if (!_favorites.contains(question)) {
      _favorites.add(question);
      _sharedPreferences.setStringList('favorites', _favorites);
    }
  }

  void removeFromFavorites(String question) {
    _favorites.remove(question);
    _sharedPreferences.setStringList('favorites', _favorites);
  }

  bool isFavorite(String question) {
    return _favorites.contains(question);
  }
}
