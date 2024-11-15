import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rosadmin/helpers/failure.dart';
import 'package:rosadmin/models/product.dart';
import 'package:rosadmin/utils/capitalizer.dart';
import 'package:rosadmin/utils/snackbar_service.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final Future<Either<Failure, Product>> Function(bool) onPublishedChange;
  final Future<Either<Failure, Product>> Function(bool) onFeaturedChange;
  final Future<Either<Failure, Product>> Function() onDelete;

  const ProductItem({
    super.key,
    required this.product,
    required this.onPublishedChange,
    required this.onFeaturedChange,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final moneyFormatter =
        NumberFormat.simpleCurrency(locale: 'en_CA', name: 'CAD');

    return LayoutBuilder(
      builder: (context, constraints) {
        // Adjust layout based on width
        bool isWideScreen = constraints.maxWidth > 600;

        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => context.pushNamed(
                    'product_detail',
                    queryParameters: {
                      "pid": product.id,
                      "name": product.name,
                      "description": product.description,
                      "price": (product.price / 100).toString(),
                      "published": product.published.toString(),
                      "featured": product.featured.toString(),
                      "imageUrl": product.image,
                      "category": product.category.name,
                      "weighed": product.weighed.toString()
                    },
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: isWideScreen ? 2 : 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              capitalizer(product.name),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Category: ${capitalizer(product.category.name)}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      if (isWideScreen) const Spacer(),
                      Text(
                        moneyFormatter.format(product.price / 100),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                isWideScreen
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildButtons(context, isWideScreen),
                          _buildSwitches(context),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildButtons(context, isWideScreen),
                          const SizedBox(height: 16),
                          _buildSwitches(context),
                        ],
                      ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildButtons(BuildContext context, bool isWideScreen) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              padding: EdgeInsets.symmetric(
                  vertical: isWideScreen ? 8 : 0,
                  horizontal: isWideScreen ? 16 : 8),
            ),
            onPressed: () =>
                context.pushNamed("form_product", queryParameters: {
              "pid": product.id,
              "name": product.name,
              "description": product.description,
              "price": (product.price / 100).toString(),
              "imageUrl": product.image,
              "category": product.category.id,
              "weighed": product.weighed.toString(),
            }),
            child: isWideScreen
                ? Text('EDIT',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary))
                : Icon(Icons.edit,
                    color: Theme.of(context).colorScheme.primary),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              backgroundColor: Theme.of(context).colorScheme.errorContainer,
              padding: EdgeInsets.symmetric(
                  vertical: isWideScreen ? 8 : 0,
                  horizontal: isWideScreen ? 16 : 8),
            ),
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
                          if (context.mounted)
                            Navigator.of(context).pop(); // Close dialog
                          response.match(
                            (l) => SnackBarService.showNegativeSnackBar(
                              context: context,
                              message: l.message,
                            ),
                            (r) => SnackBarService.showPositiveSnackBar(
                              context: context,
                              message: "${r.name} removed from products",
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.errorContainer,
                        ),
                        child: Text(
                          'Delete',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            child: isWideScreen
                ? const Text('DELETE PRODUCT',
                    style: TextStyle(color: Colors.white))
                : const Icon(Icons.delete, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildSwitches(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            const Text('Published'),
            Switch.adaptive(
              value: product.published,
              onChanged: (value) async {
                final response = await onPublishedChange(value);
                response.match(
                  (l) => SnackBarService.showNegativeSnackBar(
                      context: context, message: l.message),
                  (r) => SnackBarService.showPositiveSnackBar(
                    context: context,
                    message: "Updated status of publication for ${r.name}",
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          children: [
            const Text('Featured'),
            Switch.adaptive(
              value: product.featured,
              onChanged: (value) async {
                final response = await onFeaturedChange(value);
                response.match(
                  (l) => SnackBarService.showNegativeSnackBar(
                      context: context, message: l.message),
                  (r) => SnackBarService.showPositiveSnackBar(
                    context: context,
                    message: "Updated status for ${r.name}",
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
