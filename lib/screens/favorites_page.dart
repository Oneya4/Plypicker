import 'package:flutter/material.dart';
import 'package:plypicker/helpers/add_favorites.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final helperFunctions = AddFavorites();

    return Scaffold(
      body: helperFunctions.favorites.isNotEmpty
          ? const Center(child: Text('No favorites yet'))
          : ListView.separated(
              itemCount: 2,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: ((context, index) => const ListTile(
                    leading: CircleAvatar(),
                  )),
            ),
    );
  }
}
