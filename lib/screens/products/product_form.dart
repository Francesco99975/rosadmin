import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rosadmin/constants/endpoints.dart';
import 'package:rosadmin/models/category.dart';
import 'package:rosadmin/models/product.dart';
import 'package:rosadmin/providers/categories.dart';
import 'package:rosadmin/providers/products.dart';
import 'package:rosadmin/utils/snackbar_service.dart';
import 'package:rosadmin/widgets/async_provider_wrapper.dart';

class ProductFormScreen extends ConsumerStatefulWidget {
  static const routePath = "/product/new";

  final String? pid;
  final String? name;
  final String? description;
  final double? price;
  final bool? published;
  final bool? featured;
  final String? imageUrl;
  final String? category;
  final bool? weighed;
  final int? lv;

  const ProductFormScreen({
    super.key,
    this.pid,
    this.name,
    this.description,
    this.price,
    this.published,
    this.featured,
    this.imageUrl,
    this.category,
    this.weighed,
    this.lv,
  });

  @override
  ConsumerState<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends ConsumerState<ProductFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _id;
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late String _selectedCategory;
  late bool _weighed;
  late int _lv;
  File? _image;

  @override
  void initState() {
    super.initState();
    _id = widget.pid ?? "";
    _nameController = TextEditingController(text: widget.name ?? "");
    _descriptionController =
        TextEditingController(text: widget.description ?? "");
    _priceController =
        TextEditingController(text: widget.price?.toString() ?? "");
    _selectedCategory = widget.category ?? "";
    _weighed = widget.weighed ?? false;
    _lv = widget.lv ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: context.pop,
        ),
        title: Text(_id.isEmpty ? 'New Product' : 'Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _priceController,
                  decoration: const InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                Text(
                  'Labor Value: $_lv',
                  style: const TextStyle(fontSize: 24),
                ),
                Slider(
                  value: _lv.toDouble(),
                  min: 1,
                  max: 10,
                  divisions: 9, // Ensures whole number steps
                  label: _lv.toString(),
                  onChanged: (double value) {
                    setState(() {
                      _lv = value.toInt();
                    });
                  },
                ),
                const SizedBox(height: 16),
                AsyncProviderWrapper(
                    provider: categoriesProvider,
                    future: categoriesProvider.future,
                    render: (categories) {
                      return DropdownButton<String>(
                          value: _selectedCategory.isEmpty
                              ? null
                              : _selectedCategory,
                          hint: const Text("Select a Category"),
                          items: categories
                              .map((e) => DropdownMenuItem<String>(
                                    value: e.id,
                                    child: Text(e.name),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                _selectedCategory = value;
                              });
                            }
                          });
                    }),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('Weighed'),
                    const Spacer(),
                    Switch(
                      value: _weighed,
                      onChanged: (value) {
                        setState(() {
                          _weighed = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _imagePickerButton(),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submitForm,
                  child:
                      Text(_id.isEmpty ? 'Create Product' : 'Update Product'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _imagePickerButton() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _id.isNotEmpty && _image == null
            ? CachedNetworkImage(
                imageUrl: "${Endpoints.baseUrl}${widget.imageUrl!}",
                fit: BoxFit.contain,
                height: 150,
                width: 150,
                cacheKey: widget.imageUrl! + DateTime.now().toIso8601String(),
              )
            : (_image != null
                ? Image.file(
                    _image!,
                    height: 150,
                    width: 150,
                    fit: BoxFit.contain,
                  )
                : Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[200],
                    child: const Icon(Icons.image),
                  )),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: _getImage,
          child: const Text('Pick Image'),
        ),
      ],
    );
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  Future<void> _submitForm() async {
    try {
      if (_formKey.currentState!.validate()) {
        final priceSpec = (double.parse(_priceController.text) * 100).toInt();

        final product = Product(
            id: _id,
            name: _nameController.text,
            description: _descriptionController.text,
            price: priceSpec,
            image: _image != null ? _image!.path : widget.imageUrl!,
            featured: widget.featured ?? false,
            published: widget.published ?? false,
            category: Category(
                id: _selectedCategory, name: ""), //Fix This shoould be dropdown
            weighed: _weighed,
            lv: _lv,
            created: DateTime.now(),
            updated: DateTime.now());

        final response = _id.isEmpty
            ? await ref.read(productsProvider.notifier).add(product)
            : await ref.read(productsProvider.notifier).updateProduct(product);

        response.match(
            (l) => SnackBarService.showNegativeSnackBar(
                context: context, message: l.message), (r) {
          SnackBarService.showPositiveSnackBar(
              context: context,
              message:
                  "${r.name} ${widget.pid == null ? 'added to products' : 'updated'} successfully");

          Navigator.pop(context);
        });
      } else {
        SnackBarService.showNegativeSnackBar(
            context: context, message: "Invalid Data");
      }
    } catch (e) {
      if (mounted) {
        SnackBarService.showNegativeSnackBar(
            context: context, message: "Something went wrong: ${e.toString()}");
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }
}
