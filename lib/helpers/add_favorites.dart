class AddFavorites {
  List<Map<String, dynamic>> _favorites = [];

  List<Map<String, dynamic>> get favorites => [..._favorites];

  void addToFavorites(Map<String, dynamic> product) {
    _favorites.add(product);

    print(_favorites);
  }
}
