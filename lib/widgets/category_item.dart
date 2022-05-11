// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class CategoryItem extends StatefulWidget {
  final Map<String, dynamic> product;
  const CategoryItem({required this.product, Key? key}) : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  final _controller = ExpandableController();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return ExpandablePanel(
      controller: _controller,
      theme: const ExpandableThemeData(hasIcon: false),
      header: Container(
        height: deviceSize.height * .13,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(widget.product['categoryImage']),
          ),
        ),
      ),
      collapsed: const SizedBox(height: 0),
      expanded: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: widget.product['subCategory'].length,
        itemBuilder: (ctx, index) => ExpansionTile(
          childrenPadding: const EdgeInsets.symmetric(vertical: 5),
          title: Text(widget.product['subCategory'][index]['categ']),
          children: List<Widget>.generate(
            widget.product['subCategory'].length,
            (index) => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(widget.product['subCategory'][index]['categ']),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
    // AnimatedContainer(
    //   duration: const Duration(milliseconds: 300),
    //   height: _expanded
    //       ? min(widget.product['subCategory'].length * 30.0 + 300, 550)
    //       : 128,
    //   child: Column(
    //     children: [
    //       GestureDetector(
    //         onTap: () {
    //           setState(() => _expanded = !_expanded);
    //         },
    //         child: Container(
    //           height: 127,
    //           padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
    //           width: MediaQuery.of(context).size.width,
    //           color: Colors.grey[300],
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Row(
    //                     children: [
    //                       Text(widget.product['categoryTitle']),
    //                       Icon(
    //                         _expanded ? Icons.expand_less : Icons.expand_more,
    //                       )
    //                     ],
    //                   ),
    //                   Text(widget.product['categoryDescription']),
    //                   const SizedBox(height: 12),
    //                 ],
    //               ),
    //               Image.network(widget.product['categoryImage']),
    //             ],
    //           ),
    //         ),
    //       ),
    //       AnimatedContainer(
    //         duration: const Duration(milliseconds: 300),
    //         height: _expanded
    //             ? min(widget.product['subCategory'].length * 50.0 + 5, 450)
    //             : 0,
            // child: ListView.builder(
            //   itemCount: widget.product['subCategory'].length,
            //   itemBuilder: (ctx, index) => ExpansionTile(
            //     title: Text(widget.product['subCategory'][index]['categ']),
            //   ),
            // ),
    //       ),
    //     ],
    //   ),
    // );
