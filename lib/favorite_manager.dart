class FavoriteManager {
  static List<String> favorites = [];

  static void addFavorite(String venueName) {
    if (!favorites.contains(venueName)) {
      favorites.add(venueName);
    }
  }

  static void removeFavorite(String venueName) {
    favorites.remove(venueName);
  }

  static bool isFavorite(String venueName) {
    return favorites.contains(venueName);
  }
}