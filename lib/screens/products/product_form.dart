import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rosadmin/models/category.dart';
import 'package:rosadmin/models/product.dart';
import 'package:rosadmin/providers/products.dart';
import 'package:rosadmin/utils/snackbar_service.dart';

class ProductFormScreen extends ConsumerStatefulWidget {
  final bool isNewProduct;
  final String? pid;
  final String? name;
  final String? description;
  final double? price;
  final String? imageUrl;
  final String? category;
  final bool? weighed;

  const ProductFormScreen({
    super.key,
    required this.isNewProduct,
    this.pid,
    this.name,
    this.description,
    this.price,
    this.imageUrl,
    this.category,
    this.weighed,
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
  late TextEditingController _categoryController;
  late bool _weighed;
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
    _categoryController = TextEditingController(
        text: widget.category ?? ""); //Fix This shoould be dropdown
    _weighed = widget.weighed ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(widget.isNewProduct ? 'New Product' : 'Edit Product'),
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
                TextFormField(
                  controller: _categoryController,
                  decoration: const InputDecoration(
                      labelText: 'Category'), //Fix This shoould be dropdown
                ),
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
                  child: Text(widget.isNewProduct
                      ? 'Create Product'
                      : 'Update Product'),
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
        _image != null
            ? Image.file(
                _image!,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              )
            : Container(
                height: 150,
                width: 150,
                color: Colors.grey[200],
                child: const Icon(Icons.image),
              ),
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
            image: _image!.path,
            featured: false,
            published: true,
            category: Category(
                id: _categoryController.text,
                name: ""), //Fix This shoould be dropdown
            weighed: _weighed,
            created: DateTime.now(),
            updated: DateTime.now());

        final response = widget.isNewProduct
            ? await ref.read(productsProvider.notifier).add(product)
            : await ref.read(productsProvider.notifier).updateProduct(product);

        response.match(
            (l) => SnackBarService.showNegativeSnackBar(
                context: context, message: l.message),
            (r) => SnackBarService.showPositiveSnackBar(
                context: context,
                message: "${r.name} added to products successfully"));
      }
    } catch (e) {
      if (mounted) {
        SnackBarService.showNegativeSnackBar(
            context: context, message: e.toString());
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _categoryController.dispose();
    super.dispose();
  }
}
