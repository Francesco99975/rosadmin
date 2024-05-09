import 'package:flutter/material.dart';
import 'package:rosadmin/utils/capitalizer.dart';

class CategoryItem extends StatelessWidget {
  final String categoryName;

  const CategoryItem({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ListTile(
        tileColor: Theme.of(context).colorScheme.surface,
        title: Text(
          capitalizer(categoryName),
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
