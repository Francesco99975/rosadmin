import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rosadmin/constants/endpoints.dart';
import 'package:rosadmin/helpers/failure.dart';
import 'package:rosadmin/helpers/network.dart';
import 'package:rosadmin/models/customer.dart';

part 'customers.g.dart';

@riverpod
class Customers extends _$Customers {
  @override
  Future<Either<Failure, List<Customer>>> build() async {
    final network = ref.read(networkProvider);

    return network.match((l) => Left(Failure(message: l.message)),
        (network) async {
      final response = await network.getRequest(
        url: Endpoints.customersEndpoint,
      );

      return response.match((l) => Left(l), (r) {
        final List<dynamic> data = jsonDecode(r.body);
        return Right((data.map((e) => Customer.fromMap(e)).toList()));
      });
    });
  }

  Future<Either<Failure, Customer>> remove(Customer customer) async {
    final network = ref.read(networkProvider);

    return network.match((l) => Left(Failure(message: l.message)),
        (network) async {
      final response = await network.deleteRequest(
          url: "${Endpoints.customersEndpoint}/${customer.id}");

      return response.match((l) => Left(l), (r) {
        final List<dynamic> data = jsonDecode(r.body);
        final updatedState = (data.map((e) => Customer.fromMap(e)).toList());
        state = AsyncValue.data(Right(updatedState));
        return Right(customer);
      });
    });
  }
}
