import 'dart:math';

import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  final Map<String, dynamic> tt;
  const CategoryItem({required this.tt, Key? key}) : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: _expanded
          ? min(widget.tt['subCategory'].length * 30.0 + 300, 550)
          : 128,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() => _expanded = !_expanded);
            },
            child: Container(
              height: 127,
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[300],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(widget.tt['categoryTitle']),
                          Icon(
                            _expanded ? Icons.expand_less : Icons.expand_more,
                          )
                        ],
                      ),
                      Text(widget.tt['categoryDescription']),
                      const SizedBox(height: 12),
                    ],
                  ),
                  Image.network(widget.tt['categoryImage']),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _expanded
                ? min(widget.tt['subCategory'].length * 50.0 + 5, 450)
                : 0,
            child: ListView.builder(
              itemCount: widget.tt['subCategory'].length,
              itemBuilder: (ctx, index) => ExpansionTile(
                title: Text(widget.tt['subCategory'][index]['categ']),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
