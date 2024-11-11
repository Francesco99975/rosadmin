import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:fpdart/fpdart.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:rosadmin/constants/endpoints.dart";
import "package:rosadmin/helpers/failure.dart";
import "package:rosadmin/helpers/network.dart";
import "package:rosadmin/models/graph.dart";
import "package:rosadmin/models/visit.dart";

part 'visits.g.dart';

@riverpod
Future<Either<Failure, Visit>> visits(
    VisitsRef ref, String quality, String timeframe) async {
  final network = ref.read(networkProvider);

  return network.match((l) => Left(l), (network) async {
    final response = await network.getRequest(
      url: "${Endpoints.visitsEndpoint}?quality=$quality&timeframe=$timeframe",
    );

    return response.match((l) => Left(l), (r) {
      return Right(Visit.fromJson(r.body));
    });
  });
}

@riverpod
Future<Either<Failure, VisitStats>> vistat(Ref ref) async {
  final network = ref.read(networkProvider);

  return network.match((l) => Left(l), (network) async {
    final response = await network.getRequest(
      url: Endpoints.visitsStatsEndpoint,
    );

    return response.match((l) => Left(l), (r) {
      return Right(VisitStats.fromJson(r.body));
    });
  });
}

@riverpod
Future<Either<Failure, GraphData>> visdata(
    Ref ref, String quality, String timeframe) async {
  final network = ref.read(networkProvider);

  return network.match((l) => Left(l), (network) async {
    final response = await network.getRequest(
      url: "${Endpoints.visitsEndpoint}?quality=$quality&timeframe=$timeframe",
    );

    return response.match((l) => Left(l), (r) {
      return Right(GraphData.fromJson(r.body));
    });
  });
}

@riverpod
Future<Either<Failure, VisitStandings>> vistands(Ref ref) async {
  final network = ref.read(networkProvider);

  return network.match((l) => Left(l), (network) async {
    final response =
        await network.getRequest(url: Endpoints.visitsStandingsEndpoint);

    return response.match((l) => Left(l), (r) {
      return Right(VisitStandings.fromJson(r.body));
    });
  });
}
