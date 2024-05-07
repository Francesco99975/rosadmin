import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rosadmin/constants/endpoints.dart';
import 'package:rosadmin/helpers/failure.dart';
import 'package:rosadmin/helpers/network.dart';
import 'package:rosadmin/models/product.dart';

part 'products.g.dart';

@riverpod
class Products extends _$Products {
  @override
  Future<Either<Failure, List<Product>>> build() async {
    final network = ref.read(networkProvider);

    final response = await network.getRequest(
      url: Endpoints.productsEndpoint,
    );

    return response.match((l) => Left(l), (r) {
      final data = jsonDecode(r.body) as List<Map<String, dynamic>>;
      return Right((data.map((e) => Product.fromMap(e)).toList()));
    });
  }

  Future<Either<Failure, Product>> add(Product product) async {
    final network = ref.read(networkProvider);

    final response = await network.postRequest(
        url: Endpoints.productsEndpoint, body: product.toMap());

    return response.match((l) => Left(l), (r) {
      final data = jsonDecode(r.body) as List<Map<String, dynamic>>;
      final updatedState = (data.map((e) => Product.fromMap(e)).toList());
      state = AsyncValue.data(Right(updatedState));
      return Right(updatedState.last);
    });
  }

  Future<Either<Failure, Product>> updateProduct(Product product) async {
    final network = ref.read(networkProvider);

    final response = await network.putRequest(
        url: Endpoints.productsEndpoint, body: product.toMap());

    return response.match((l) => Left(l), (r) {
      final data = jsonDecode(r.body) as List<Map<String, dynamic>>;
      final updatedState = (data.map((e) => Product.fromMap(e)).toList());
      state = AsyncValue.data(Right(updatedState));
      return Right(updatedState.last);
    });
  }

  Future<Either<Failure, Product>> remove(Product product) async {
    final network = ref.read(networkProvider);

    final response = await network.deleteRequest(
        url: "${Endpoints.productsEndpoint}/${product.id}");

    return response.match((l) => Left(l), (r) {
      final data = jsonDecode(r.body) as List<Map<String, dynamic>>;
      final updatedState = (data.map((e) => Product.fromMap(e)).toList());
      state = AsyncValue.data(Right(updatedState));
      return Right(updatedState.last);
    });
  }
}
