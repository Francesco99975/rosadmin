import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rosadmin/models/category.dart';
import 'package:rosadmin/providers/categories.dart';
import 'package:rosadmin/widgets/async_provider_wrapper.dart';
import 'package:rosadmin/widgets/category_item.dart';
import 'package:rosadmin/widgets/empty.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({super.key});

  static const routePath = "/categories";

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  late TextEditingController _categoryController;

  @override
  void initState() {
    super.initState();
    _categoryController = TextEditingController();
  }

  @override
  void dispose() {
    _categoryController.dispose();
    super.dispose();
  }

  void _showAddCategoryModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Category',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(
                  labelText: 'Category Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  final category =
                      Category(id: "", name: _categoryController.text);
                  await ref.read(categoriesProvider.notifier).add(category);
                  if (context.mounted) Navigator.of(context).pop();
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoriesProvider);

    return AsyncProviderWrapper<List<Category>>(
        state: categories,
        onRetry: () => ref.refresh(categoriesProvider.future),
        render: (categoryList) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Categories'),
            ),
            body: categoryList.isEmpty
                ? const EmptyListMessage(
                    message: "No categories yet", iconData: Icons.error_outline)
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 56),
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      final category = categoryList[index];
                      return Dismissible(
                        key: Key(category.id),
                        background: Container(
                          padding: const EdgeInsets.only(right: 20),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 4.0),
                          color: Theme.of(context).colorScheme.error,
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        confirmDismiss: (direction) async {
                          if (direction == DismissDirection.endToStart) {
                            return await showDialog(
                                context: context,
                                builder: (context) => AlertDialog.adaptive(
                                      title: const Text("Are you sure?"),
                                      content: const Text(
                                          "Do you want to delete this category?"),
                                      actions: <Widget>[
                                        ElevatedButton(
                                          child: const Text("No"),
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                        ),
                                        ElevatedButton(
                                          child: const Text("Yes"),
                                          onPressed: () =>
                                              Navigator.of(context).pop(true),
                                        ),
                                      ],
                                    ));
                          }

                          return false;
                        },
                        onDismissed: (direction) async {
                          if (direction == DismissDirection.endToStart) {
                            final response = await ref
                                .read(categoriesProvider.notifier)
                                .remove(category);

                            response.match((l) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(l.message),
                                backgroundColor:
                                    Theme.of(context).colorScheme.error,
                                duration: const Duration(seconds: 5),
                              ));
                            }, (r) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                    "${r.name} added to Categories Successfully"),
                                backgroundColor:
                                    Theme.of(context).colorScheme.onBackground,
                                duration: const Duration(seconds: 5),
                              ));
                            });
                          }
                        },
                        child: CategoryItem(categoryName: category.name),
                      );
                    },
                  ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _showAddCategoryModal(context),
              elevation: 2.0,
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}
