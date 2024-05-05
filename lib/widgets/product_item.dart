import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String productName;
  final String category;
  final double price;
  final bool isPublished;
  final bool isFeatured;

  const ProductItem({
    super.key,
    required this.productName,
    required this.category,
    required this.price,
    required this.isPublished,
    required this.isFeatured,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                // Go to product details page here
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Category: $category',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text('Published'),
                      Switch(
                        value: isPublished,
                        onChanged: (value) {
                          // Handle switch change here
                        },
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      const Text('Featured'),
                      Switch(
                        value: isFeatured,
                        onChanged: (value) {
                          // Handle switch change here
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
