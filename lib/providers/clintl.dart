import "package:fpdart/fpdart.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";
import "package:rosadmin/constants/endpoints.dart";
import "package:rosadmin/helpers/failure.dart";
import "package:rosadmin/helpers/network.dart";
import "package:rosadmin/models/clientele.dart";

part 'clintl.g.dart';

@riverpod
Future<Either<Failure, Clientele>> clintl(
    ClintlRef ref, String timeframe) async {
  final network = ref.read(networkProvider);

  return network.match((l) => Left(Failure(message: l.message)),
      (network) async {
    final response = await network.getRequest(
      url: "${Endpoints.clienteleEndpoint}?timeframe=$timeframe",
    );

    return response.match((l) => Left(l), (r) {
      return Right(Clientele.fromJson(r.body));
    });
  });
}
