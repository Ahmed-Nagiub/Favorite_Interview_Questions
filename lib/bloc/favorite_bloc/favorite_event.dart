abstract class FavoriteEvent {}

class LoadFavorites extends FavoriteEvent {}

class AddFavorite extends FavoriteEvent {
  final String question;
  AddFavorite(this.question);
}

class RemoveFavorite extends FavoriteEvent {
  final String question;
  RemoveFavorite(this.question);
}
