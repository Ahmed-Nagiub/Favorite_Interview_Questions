abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<String> favoriteQuestions;
  FavoriteLoaded(this.favoriteQuestions);

}

class FavoriteError extends FavoriteState {
  final String error;
  FavoriteError(this.error);
}
