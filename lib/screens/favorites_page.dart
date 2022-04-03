import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favorite_products.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<FavoriteProducts>(context).favorites;
    final unfavoriteFunction = Provider.of<FavoriteProducts>(context);
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: favorites.isEmpty
          ? const Center(child: Text('No favorites yet'))
          : ListView.separated(
              itemCount: favorites.length,
              separatorBuilder: (context, index) => const Divider(thickness: 2),
              itemBuilder: ((context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: deviceSize.height * .12,
                          width: deviceSize.width * .18,
                          child: Image.network(
                            favorites[index]['product_image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(favorites[index]['product_name']),
                            Text(
                              favorites[index]['brand'],
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text('Rs.${favorites[index]['discounted_price']}'),
                          ],
                        ),
                        const SizedBox(),
                        GestureDetector(
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 30,
                          ),
                          onTap: () => unfavoriteFunction
                              .removeFromFavorites(favorites[index]),
                        ),
                      ],
                    ),
                  )),
            ),
    );
  }
}
