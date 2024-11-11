import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rosadmin/models/product.dart';
import 'package:rosadmin/providers/categories.dart';
import 'package:rosadmin/providers/products.dart';
import 'package:rosadmin/screens/products/product_form.dart';
import 'package:rosadmin/widgets/async_provider_overwriter.dart';
import 'package:rosadmin/widgets/async_provider_wrapper.dart';
import 'package:rosadmin/widgets/empty.dart';
import 'package:rosadmin/widgets/fab.dart';
import 'package:rosadmin/widgets/main_drawer.dart';
import 'package:rosadmin/widgets/product_item.dart';

class ProductScreen extends ConsumerWidget {
  static const String routePath = "/products";

  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncProviderWrapper<List<Product>>(
        provider: productsProvider,
        future: productsProvider.future,
        render: (products) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Products'),
            ),
            drawer: const MainDrawer(
              active: ProductScreen.routePath,
            ),
            body: products.isEmpty
                ? const EmptyListMessage(
                    message: "No products yet", iconData: Icons.error_outline)
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductItem(
                          product: product,
                          onPublishedChange: (value) => ref
                              .read(productsProvider.notifier)
                              .updateProduct(
                                  product.copyWith(published: value)),
                          onFeaturedChange: (value) => ref
                              .read(productsProvider.notifier)
                              .updateProduct(product.copyWith(featured: value)),
                          onDelete: () => ref
                              .read(productsProvider.notifier)
                              .remove(product));
                    },
                  ),
            floatingActionButton: AsyncProviderOverwriter(
                state: ref.watch(categoriesProvider),
                loadingWidget:
                    const LoadingFAB(tooltip: "loading", icon: Icons.refresh),
                errorWidget: const DisabledFAB(
                    tooltip: "No categories yet", icon: Icons.error),
                render: (categories) {
                  if (categories.isNotEmpty) {
                    return FloatingActionButton(
                      onPressed: () =>
                          context.push(ProductFormScreen.routePath),
                      child: const Icon(Icons.add),
                    );
                  } else {
                    return const DisabledFAB(
                        tooltip: "No categories yet", icon: Icons.error);
                  }
                }),
          );
        });
  }
}
