import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductFormScreen extends StatefulWidget {
  final bool isNewProduct;
  final String? name;
  final String? description;
  final double? price;
  final String? imageUrl;
  final String? category;
  final bool? weighed;

  const ProductFormScreen({
    super.key,
    required this.isNewProduct,
    this.name,
    this.description,
    this.price,
    this.imageUrl,
    this.category,
    this.weighed,
  });

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _categoryController;
  late bool _weighed;
  File? _image;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _descriptionController = TextEditingController(text: widget.description);
    _priceController = TextEditingController(text: widget.price?.toString());
    _categoryController = TextEditingController(text: widget.category);
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
                // Text form fields remain the same
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, send form data
      final formData = {
        'name': _nameController.text,
        'description': _descriptionController.text,
        'price': double.parse(_priceController.text),
        'category': _categoryController.text,
        'weighed': _weighed,
        // Include image file in form data if available
        'image': _image,
      };

      // Send form data to server
      _uploadFormData(formData);
    }
  }

  void _uploadFormData(Map<String, dynamic> formData) {
    // Upload form data to server
    // Implement your server upload logic here
    print(formData);
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
