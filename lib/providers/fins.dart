import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:fpdart/fpdart.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:rosadmin/constants/endpoints.dart";
import "package:rosadmin/helpers/failure.dart";
import "package:rosadmin/helpers/network.dart";
import "package:rosadmin/models/finances.dart";
import "package:rosadmin/models/graph.dart";

part 'fins.g.dart';

@riverpod
Future<Either<Failure, Finances>> fins(
    FinsRef ref, String timeframe, String method, String status) async {
  final network = ref.read(networkProvider);

  return network.match((l) => Left(Failure(message: l.message)),
      (network) async {
    final response = await network.getRequest(
      url:
          "${Endpoints.financesEndpoint}?timeframe=$timeframe&method=$method&status=$status",
    );

    return response.match((l) => Left(l), (r) {
      return Right(Finances.fromJson(r.body));
    });
  });
}

@riverpod
Future<Either<Failure, FinancesStats>> finsts(Ref ref) async {
  final network = ref.read(networkProvider);

  return network.match((l) => Left(Failure(message: l.message)),
      (network) async {
    final response = await network.getRequest(
      url: Endpoints.finStatsEndpoint,
    );

    return response.match((l) => Left(l), (r) {
      return Right(FinancesStats.fromJson(r.body));
    });
  });
}

@riverpod
Future<Either<Failure, GraphData>> finord(
    Ref ref, String timeframe, String method, String status) async {
  final network = ref.read(networkProvider);

  return network.match((l) => Left(Failure(message: l.message)),
      (network) async {
    final response = await network.getRequest(
      url:
          "${Endpoints.finOrdersEndpoint}?timeframe=$timeframe&method=$method&status=$status",
    );

    return response.match((l) => Left(l), (r) {
      return Right(GraphData.fromJson(r.body));
    });
  });
}

@riverpod
Future<Either<Failure, GraphData>> finmon(
    Ref ref, String timeframe, String method, String status) async {
  final network = ref.read(networkProvider);

  return network.match((l) => Left(Failure(message: l.message)),
      (network) async {
    final response = await network.getRequest(
      url:
          "${Endpoints.finMonetaryEndpoint}?timeframe=$timeframe&method=$method&status=$status",
    );

    return response.match((l) => Left(l), (r) {
      return Right(GraphData.fromJson(r.body));
    });
  });
}

@riverpod
Future<Either<Failure, MultiGraphData>> finpay(
    Ref ref, String timeframe, String status) async {
  final network = ref.read(networkProvider);

  return network.match((l) => Left(Failure(message: l.message)),
      (network) async {
    final response = await network.getRequest(
      url:
          "${Endpoints.finPaymentsEndpoint}?timeframe=$timeframe&status=$status",
    );

    return response.match((l) => Left(l), (r) {
      return Right(MultiGraphData.fromJson(r.body));
    });
  });
}

@riverpod
Future<Either<Failure, GraphPie>> finstatus(Ref ref) async {
  final network = ref.read(networkProvider);

  return network.match((l) => Left(Failure(message: l.message)),
      (network) async {
    final response = await network.getRequest(url: Endpoints.finStatusEndpoint);

    return response.match((l) => Left(l), (r) {
      return Right(GraphPie.fromJson(r.body));
    });
  });
}

@riverpod
Future<Either<Failure, GraphPie>> finmethods(Ref ref) async {
  final network = ref.read(networkProvider);

  return network.match((l) => Left(Failure(message: l.message)),
      (network) async {
    final response =
        await network.getRequest(url: Endpoints.finMethodsEndpoint);

    return response.match((l) => Left(l), (r) {
      return Right(GraphPie.fromJson(r.body));
    });
  });
}

@riverpod
Future<Either<Failure, FinancesStandings>> finstads(Ref ref) async {
  final network = ref.read(networkProvider);

  return network.match((l) => Left(Failure(message: l.message)),
      (network) async {
    final response = await network.getRequest(url: Endpoints.finStandsEndpoint);

    return response.match((l) => Left(l), (r) {
      return Right(FinancesStandings.fromJson(r.body));
    });
  });
}
