import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:plypicker/providers/favorite_products.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final favoriteFunction = Provider.of<FavoriteProducts>(context);

    return Scaffold(
      body: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          // mainAxisExtent: 300,
          childAspectRatio: 0.65,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
        itemBuilder: (ctx, index) => Container(
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
          child: GridTile(
            child: Image.network(
              products[index]['product_image'],
              fit: BoxFit.cover,
            ),
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(products[index]['product_name']),
                      GestureDetector(
                        onTap: () {
                          if (!favoriteFunction.favorites
                              .contains(products[index])) {
                            favoriteFunction.addToFavorites(products[index]);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Product already in favorites'),
                              ),
                            );
                          }
                          setState(() {});
                        },
                        child:
                            favoriteFunction.favorites.contains(products[index])
                                ? const Icon(Icons.favorite, color: Colors.red)
                                : const Icon(Icons.favorite_border_outlined),
                      ),
                    ],
                  ),
                  Text(
                    products[index]['brand'],
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Rs.${products[index]['discounted_price']} ',
                      style: const TextStyle(fontSize: 13),
                      children: [
                        TextSpan(
                          text: 'Rs.${products[index]['original_price']}',
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  '\t\t-${products[index]['discount_percentage']}%',
                              style: const TextStyle(
                                inherit: false,
                                decoration: TextDecoration.none,
                                fontSize: 13,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  RatingBar.builder(
                    ignoreGestures: true,
                    glow: false,
                    itemSize: 15,
                    updateOnDrag: false,
                    minRating: 1,
                    maxRating: 5,
                    itemCount: 5,
                    initialRating: products[index]['rating'],
                    allowHalfRating: true,
                    itemBuilder: ((context, index) => Icon(
                          Icons.star,
                          color: Colors.orange[600],
                        )),
                    onRatingUpdate: (_) {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> products = [
  {
    "product_id": 6645131324512151,
    "product_image":
        "https://images.unsplash.com/photo-1600566752355-35792bedcfea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YmF0aHJvb218ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    "product_name": "Modular bathroom 1",
    "brand": "Cera",
    "original_price": 5000,
    "discounted_price": 3500,
    "discount_percentage": 20,
    "rating": 4.1,
  },
  {
    "product_id": 6645131324512152,
    "product_image":
        "https://images.unsplash.com/photo-1603825491103-bd638b1873b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8YmF0aHJvb218ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
    "product_name": "Modular bathroom 2",
    "brand": "Hindware",
    "original_price": 10000,
    "discounted_price": 900,
    "discount_percentage": 10,
    "rating": 4.5,
  },
  {
    "product_id": 6645131324512153,
    "product_image":
        "https://images.unsplash.com/photo-1586798271654-0471bb1b0517?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGJhdGhyb29tfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "product_name": "Modular bathroom 3",
    "brand": "Airolam",
    "original_price": 4500,
    "discounted_price": 2500,
    "discount_percentage": 40,
    "rating": 3.8
  },
  {
    "product_id": 6645131324512154,
    "product_image":
        "https://images.unsplash.com/photo-1629079447777-1e605162dc8d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGJhdGhyb29tfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "product_name": "Modular bathroom 4",
    "brand": "Europa",
    "original_price": 6000,
    "discounted_price": 5500,
    "discount_percentage": 5,
    "rating": 4.2,
  },
  {
    "product_id": 6645131324512155,
    "product_image":
        "https://images.unsplash.com/photo-1628602813485-4e8b09442e98?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGJhdGhyb29tfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "product_name": "Modular bathroom 5",
    "brand": "Elica",
    "original_price": 8000,
    "discounted_price": 5500,
    "discount_percentage": 35,
    "rating": 4.4,
  },
  {
    "product_id": 6645131324512156,
    "product_image":
        "https://images.unsplash.com/photo-1604014237744-2f4ab6bfbcc2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGJhdGhyb29tfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "product_name": "Modular bathroom 6",
    "brand": "Jaquar",
    "original_price": 11000,
    "discounted_price": 10500,
    "discount_percentage": 5,
    "rating": 4.6,
  },
  {
    "product_id": 6645131324512157,
    "product_image":
        "https://images.unsplash.com/photo-1507652313519-d4e9174996dd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fGJhdGhyb29tfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    "product_name": "Modular bathroom 7",
    "brand": "Kajaria",
    "original_price": 11000,
    "discounted_price": 9000,
    "discount_percentage": 20,
    "rating": 4.7,
  },
];
