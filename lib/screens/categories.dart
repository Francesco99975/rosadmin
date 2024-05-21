import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rosadmin/models/category.dart';
import 'package:rosadmin/providers/categories.dart';
import 'package:rosadmin/utils/snackbar_service.dart';
import 'package:rosadmin/widgets/async_provider_wrapper.dart';
import 'package:rosadmin/widgets/category_item.dart';
import 'package:rosadmin/widgets/empty.dart';
import 'package:rosadmin/widgets/main_drawer.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({super.key});

  static const routePath = "/categories";

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  final _formKey = GlobalKey<FormState>();
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
        return Form(
          key: _formKey,
          child: Padding(
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please write something...";
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final category =
                          Category(id: "", name: _categoryController.text);
                      final response = await ref
                          .read(categoriesProvider.notifier)
                          .add(category);

                      _formKey.currentState!.reset();

                      if (context.mounted) Navigator.of(context).pop();

                      response.match((l) {
                        SnackBarService.showNegativeSnackBar(
                            context: context, message: l.message);
                      }, (r) {
                        SnackBarService.showPositiveSnackBar(
                            context: context,
                            message:
                                "${r.name} added to Categories Successfully");
                      });
                    }
                  },
                  child: const Text('Add Category'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AsyncProviderWrapper<List<Category>>(
        provider: categoriesProvider,
        future: categoriesProvider.future,
        render: (categoryList) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Categories'),
            ),
            drawer: const MainDrawer(
              active: CategoryScreen.routePath,
            ),
            body: categoryList.isEmpty
                ? const EmptyListMessage(
                    message: "No categories yet", iconData: Icons.error_outline)
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 56),
                    shrinkWrap: true,
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      final category = categoryList[index];
                      return Dismissible(
                        key: Key(category.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          padding: const EdgeInsets.only(right: 20),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 4.0),
                          color: Theme.of(context).colorScheme.errorContainer,
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
                              SnackBarService.showNegativeSnackBar(
                                  context: context, message: l.message);
                            }, (r) {
                              SnackBarService.showPositiveSnackBar(
                                  context: context,
                                  message:
                                      "${r.name} removed from Categories Successfully");
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
