import 'package:flutter/material.dart';

import '/widgets/category_item.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: _tt.length,
        separatorBuilder: (ctx, index) => const Divider(),
        itemBuilder: (ctx, index) => CategoryItem(product: _tt[index]),
      ),
    );
  }
}

List<Map<String, dynamic>> _tt = [
  {
    'categoryTitle': 'Summer Shop',
    'categoryDescription': 'Turn up the heat in style',
    'categoryImage':
        'https://images.unsplash.com/photo-1600566752355-35792bedcfea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YmF0aHJvb218ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    'subCategory': [
      {'categ': 'Top Brands'},
      {'categ': 'Men'},
      {'categ': 'Women'},
      {'categ': 'Kids'},
      {'categ': 'Footware'},
      {'categ': 'Accessories'},
      {'categ': 'Jewellery'},
      {'categ': 'Beauty'},
    ],
  },
  {
    'categoryTitle': 'Men',
    'categoryDescription': 'T-shorts, Shirts,Jeans,Accessories',
    'categoryImage':
        'https://images.unsplash.com/photo-1603825491103-bd638b1873b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8YmF0aHJvb218ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    'subCategory': [
      {'categ': 'Top Brands'},
      {'categ': 'Men'},
      {'categ': 'Women'},
      {'categ': 'Kids'},
      {'categ': 'Footware'},
      {'categ': 'Accessories'},
      {'categ': 'Jewellery'},
      {'categ': 'Beauty'},
    ],
  },
  {
    'categoryTitle': 'Women',
    'categoryDescription': 'T-shorts, Shirts,Jeans,Accessories',
    'categoryImage':
        'https://images.unsplash.com/photo-1586798271654-0471bb1b0517?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGJhdGhyb29tfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'subCategory': [
      {'categ': 'Top Brands'},
      {'categ': 'Men'},
      {'categ': 'Women'},
      {'categ': 'Kids'},
      {'categ': 'Footware'},
      {'categ': 'Accessories'},
      {'categ': 'Jewellery'},
      {'categ': 'Beauty'},
    ],
  },
  {
    'categoryTitle': 'Kids',
    'categoryDescription': 'T-shorts, Shirts,Jeans,Accessories',
    'categoryImage':
        'https://images.unsplash.com/photo-1629079447777-1e605162dc8d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGJhdGhyb29tfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'subCategory': [
      {'categ': 'Top Brands'},
      {'categ': 'Men'},
      {'categ': 'Women'},
      {'categ': 'Kids'},
      {'categ': 'Footware'},
      {'categ': 'Accessories'},
      {'categ': 'Jewellery'},
      {'categ': 'Beauty'},
    ],
  },
];
