import "package:fpdart/fpdart.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:rosadmin/constants/endpoints.dart";
import "package:rosadmin/helpers/failure.dart";
import "package:rosadmin/helpers/network.dart";
import "package:rosadmin/models/finances.dart";

part 'fins.g.dart';

@riverpod
Future<Either<Failure, Finances>> fins(
    FinsRef ref, String timeframe, String method, String status) async {
  final network = ref.read(networkProvider);

  final response = await network.getRequest(
    url:
        "${Endpoints.financesEndpoint}?timeframe=$timeframe&method=$method&status=$status",
  );

  return response.match((l) => Left(l), (r) {
    return Right(Finances.fromJson(r.body));
  });
}
