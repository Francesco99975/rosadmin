import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:rosadmin/helpers/failure.dart';
import 'package:rosadmin/models/product.dart';
import 'package:rosadmin/utils/snackbar_service.dart';

class ProductItem extends StatelessWidget {
  final String productName;
  final String category;
  final double price;
  final bool isPublished;
  final bool isFeatured;
  final Future<Either<Failure, Product>> Function(bool) onPublishedChange;
  final Future<Either<Failure, Product>> Function(bool) onFeaturedChange;
  final Future<Either<Failure, Product>> Function() onDelete;

  const ProductItem(
      {super.key,
      required this.productName,
      required this.category,
      required this.price,
      required this.isPublished,
      required this.isFeatured,
      required this.onPublishedChange,
      required this.onFeaturedChange,
      required this.onDelete});

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
              onTap: () => context.go(""),
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
                      Switch.adaptive(
                        value: isPublished,
                        onChanged: (value) async {
                          final response = await onPublishedChange(value);

                          response.match(
                              (l) => SnackBarService.showNegativeSnackBar(
                                  context: context, message: l.message),
                              (r) => SnackBarService.showPositiveSnackBar(
                                  context: context,
                                  message:
                                      "Updated status of publication for ${r.name}"));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      const Text('Featured'),
                      Switch.adaptive(
                        value: isFeatured,
                        onChanged: (value) async {
                          final response = await onFeaturedChange(value);

                          response.match(
                              (l) => SnackBarService.showNegativeSnackBar(
                                  context: context, message: l.message),
                              (r) => SnackBarService.showPositiveSnackBar(
                                  context: context,
                                  message:
                                      "Updated status of status for ${r.name}"));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.surface),
                  onPressed: () => context.go(""),
                  child: Text('EDIT',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor:
                        Theme.of(context).colorScheme.errorContainer),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Confirm Removal'),
                        content: const Text(
                            'Are you sure you want to delete this product?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close dialog
                            },
                            child: const Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              final response = await onDelete();

                              if (context.mounted) {
                                Navigator.of(context).pop(); // Close dialog
                              }

                              response.match(
                                  (l) => SnackBarService.showNegativeSnackBar(
                                      context: context, message: l.message),
                                  (r) => SnackBarService.showPositiveSnackBar(
                                      context: context,
                                      message:
                                          "${r.name} removed from products"));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.errorContainer,
                            ),
                            child: const Text('Delete'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('DELETE PRODUCT',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
