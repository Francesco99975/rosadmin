import "package:fpdart/fpdart.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:rosadmin/constants/endpoints.dart";
import "package:rosadmin/helpers/failure.dart";
import "package:rosadmin/helpers/network.dart";
import "package:rosadmin/models/visit.dart";

part 'visits.g.dart';

@riverpod
Future<Either<Failure, Visit>> visits(VisitsRef ref) async {
  final network = ref.read(networkProvider);

  final response = await network.getRequest(
    url: "${Endpoints.visitsEndpoint}?quality=all&timeframe=l7",
  );

  return response.match((l) => Left(l), (r) {
    return Right(Visit.fromJson(r.body));
  });
}
