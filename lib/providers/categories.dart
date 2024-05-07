import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rosadmin/constants/endpoints.dart';
import 'package:rosadmin/helpers/failure.dart';
import 'package:rosadmin/helpers/network.dart';
import 'package:rosadmin/models/category.dart';

part 'categories.g.dart';

@riverpod
class Categories extends _$Categories {
  @override
  Future<Either<Failure, List<Category>>> build() async {
    final network = ref.read(networkProvider);

    final response = await network.getRequest(
      url: Endpoints.categoriesEndpoint,
    );

    return response.match((l) => Left(l), (r) {
      final data = jsonDecode(r.body) as List<Map<String, dynamic>>;
      return Right((data.map((e) => Category.fromMap(e)).toList()));
    });
  }

  Future<Either<Failure, Category>> add(Category category) async {
    final network = ref.read(networkProvider);

    final response = await network.postRequest(
        url: Endpoints.categoriesEndpoint, body: category.toMap());

    return response.match((l) => Left(l), (r) {
      final data = jsonDecode(r.body) as List<Map<String, dynamic>>;
      final updatedState = (data.map((e) => Category.fromMap(e)).toList());
      state = AsyncValue.data(Right(updatedState));
      return Right(updatedState.last);
    });
  }

  Future<Either<Failure, Category>> remove(Category category) async {
    final network = ref.read(networkProvider);

    final response = await network.deleteRequest(
        url: "${Endpoints.categoriesEndpoint}/${category.id}");

    return response.match((l) => Left(l), (r) {
      final data = jsonDecode(r.body) as List<Map<String, dynamic>>;
      final updatedState = (data.map((e) => Category.fromMap(e)).toList());
      state = AsyncValue.data(Right(updatedState));
      return Right(updatedState.last);
    });
  }
}
