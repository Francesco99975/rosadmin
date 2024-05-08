import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String categoryName;

  const CategoryItem({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        categoryName,
        style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
