import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rosadmin/constants/endpoints.dart';
import 'package:rosadmin/helpers/failure.dart';
import 'package:rosadmin/helpers/network.dart';
import 'package:rosadmin/models/order.dart' as model;

part 'orders.g.dart';

@riverpod
class SingleOrder extends _$SingleOrder {
  @override
  Future<Either<Failure, model.Order>> build(String id) async {
    final network = ref.read(networkProvider);
    return network.match((l) => Left(Failure(message: l.message)),
        (network) async {
      final response = await network.getRequest(
        url: "${Endpoints.ordersEndpoint}/$id",
      );

      return response.match((l) => Left(l), (r) {
        final model.Order order = model.Order.fromJson(r.body);

        return Right(order);
      });
    });
  }

  Future<Either<Failure, model.Order>> fulfillOrder(String orderId) async {
    final network = ref.read(networkProvider);

    if (state.isLoading || !state.hasValue || state.value == null) {
      return Left(Failure(message: "No order found"));
    }

    return state.value!.match((l) => Left(Failure(message: l.message)),
        (current) {
      if (current.id != orderId) {
        return Left(Failure(message: "IDs DO NOT MATCH CANNOT FULFILL"));
      }

      return network.match((l) => Left(Failure(message: l.message)),
          (network) async {
        final response = await network.getRequest(
            url: "${Endpoints.fulfillEndpoint}/$orderId");

        return response.match((l) => Left(l), (r) {
          final model.Order order = model.Order.fromJson(r.body);
          state = AsyncValue.data(Right(order));
          return Right(order);
        });
      });
    });
  }
}

@riverpod
class Orders extends _$Orders {
  @override
  Future<Either<Failure, List<model.Order>>> build() async {
    final network = ref.read(networkProvider);

    return network.match((l) => Left(Failure(message: l.message)),
        (network) async {
      final response = await network.getRequest(
        url: Endpoints.ordersEndpoint,
      );

      return response.match((l) => Left(l), (r) {
        final List<dynamic> data = jsonDecode(r.body);
        return Right((data.map((e) => model.Order.fromMap(e)).toList()));
      });
    });
  }

  Future<Either<Failure, model.Order>> get(String id) async {
    final network = ref.read(networkProvider);

    return network.match((l) => Left(Failure(message: l.message)),
        (network) async {
      final response = await network.getRequest(
        url: "${Endpoints.ordersEndpoint}/$id",
      );

      return response.match((l) => Left(l), (r) {
        final model.Order order = model.Order.fromJson(r.body);

        return Right(order);
      });
    });
  }

  Future<Either<Failure, model.Order>> add(model.Order order) async {
    final network = ref.read(networkProvider);

    return network.match((l) => Left(Failure(message: l.message)),
        (network) async {
      final response = await network.postRequest(
          url: Endpoints.ordersEndpoint, body: order.toMap());

      return response.match((l) => Left(l), (r) {
        final List<dynamic> data = jsonDecode(r.body);
        final updatedState = (data.map((e) => model.Order.fromMap(e)).toList());
        state = AsyncValue.data(Right(updatedState));
        return Right(updatedState.last);
      });
    });
  }

  Future<Either<Failure, model.Order>> updateOrder(model.Order order) async {
    final network = ref.read(networkProvider);

    return network.match((l) => Left(Failure(message: l.message)),
        (network) async {
      final response = await network.putRequest(
          url: Endpoints.ordersEndpoint, body: order.toMap());

      return response.match((l) => Left(l), (r) {
        final List<dynamic> data = jsonDecode(r.body);
        final updatedState = (data.map((e) => model.Order.fromMap(e)).toList());
        state = AsyncValue.data(Right(updatedState));
        return Right(updatedState.last);
      });
    });
  }

  Future<Either<Failure, model.Order>> remove(model.Order order) async {
    final network = ref.read(networkProvider);

    return network.match((l) => Left(Failure(message: l.message)),
        (network) async {
      final response = await network.deleteRequest(
          url: "${Endpoints.ordersEndpoint}/${order.id}");

      return response.match((l) => Left(l), (r) {
        final List<dynamic> data = jsonDecode(r.body);
        final updatedState = (data.map((e) => model.Order.fromMap(e)).toList());
        state = AsyncValue.data(Right(updatedState));
        return Right(order);
      });
    });
  }
}
