import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rosadmin/constants/endpoints.dart';
import 'package:rosadmin/helpers/failure.dart';
import 'package:rosadmin/helpers/network.dart';
import 'package:rosadmin/models/setting.dart';

part 'setters.g.dart';

@riverpod
class Online extends _$Online {
  @override
  Future<Either<Failure, bool>> build() async {
    final network = ref.read(networkProvider);

    return network.match((l) => Left(l), (network) async {
      final response = await network.getRequest(
        url: "${Endpoints.settingEndpoint}/online",
      );

      return response.match((l) => Left(l), (r) {
        final setter = Setter.fromJson(r.body);
        return Right(setter.value);
      });
    });
  }

  Future<Either<Failure, bool>> set(bool val) async {
    final network = ref.read(networkProvider);

    return network.match((l) => Left(l), (network) async {
      final response = await network.putRequest(
        url: Endpoints.settingEndpoint,
        body: Setter(setting: "online", value: val).toMap(),
      );

      return response.match((l) => Left(l), (r) {
        final setter = Setter.fromJson(r.body);
        state = AsyncValue.data(Right(setter.value));
        return Right(setter.value);
      });
    });
  }
}

@riverpod
class Operative extends _$Operative {
  @override
  Future<Either<Failure, bool>> build() async {
    final network = ref.read(networkProvider);

    return network.match((l) => Left(l), (network) async {
      final response = await network.getRequest(
        url: "${Endpoints.settingEndpoint}/operative",
      );

      return response.match((l) => Left(l), (r) {
        final setter = Setter.fromJson(r.body);
        return Right(setter.value);
      });
    });
  }

  Future<Either<Failure, bool>> set(bool val) async {
    final network = ref.read(networkProvider);

    return network.match((l) => Left(l), (network) async {
      final response = await network.putRequest(
        url: Endpoints.settingEndpoint,
        body: Setter(setting: "operative", value: val).toMap(),
      );

      return response.match((l) => Left(l), (r) {
        final setter = Setter.fromJson(r.body);
        state = AsyncValue.data(Right(setter.value));
        return Right(setter.value);
      });
    });
  }
}

@riverpod
class MessageLine extends _$MessageLine {
  @override
  Future<Either<Failure, String>> build() async {
    final network = ref.read(networkProvider);

    return network.match((l) => Left(l), (network) async {
      final response = await network.getRequest(
        url: Endpoints.messageEndpoint,
      );

      return response.match((l) => Left(l), (r) {
        return Right(jsonDecode(r.body)["message"]);
      });
    });
  }

  Future<Either<Failure, String>> set(String message) async {
    final network = ref.read(networkProvider);

    return network.match((l) => Left(l), (network) async {
      final response = await network.putRequest(
        url: Endpoints.messageEndpoint,
        body: {"message": message},
      );

      return response.match((l) => Left(l), (r) {
        return Right(jsonDecode(r.body)["message"]);
      });
    });
  }
}
