import 'dart:convert';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rosadmin/helpers/failure.dart';
import 'package:rosadmin/helpers/types.dart';
import 'package:rosadmin/providers/user.dart';
import 'package:rosadmin/res/strings.dart';
import 'package:rosadmin/utils/config.dart';
import 'package:http/http.dart';

part 'network.g.dart';

@riverpod
class Network extends _$Network {
  @override
  Either<Failure, NetworkRepo> build() {
    final user = ref.watch(userxProvider);

    return switch (user) {
      AsyncData(:final value) =>
        value.match((l) => Left(Failure(message: l.message)), (r) {
          return r.match(
              () => Right(NetworkRepo(authToken: const Option<String>.none())),
              (t) => Right(NetworkRepo(authToken: Option<String>.of(t.token))));
        }),
      AsyncError(:final error) => Left(Failure(message: error.toString())),
      _ => Left(Failure(message: "Network not responding unexpectedly"))
    };
  }
}

class NetworkRepo {
  final Option<String> _authToken;

  NetworkRepo({required Option<String> authToken}) : _authToken = authToken;

  FutureEither<Response> getRequest(
      {required String url, bool requireAuth = true}) async {
    final token = _authToken.getOrElse(() => "");
    final Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Cookie": "token=$token"
    };
    if (requireAuth) {
      if (_authToken.isNone()) {
        return Left(Failure(message: FailureMessage.authTokenEmpty));
      }
    }
    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpGet);
      log('requireAuth : $requireAuth', name: LogLabel.httpGet);
    }
    try {
      final response = await get(Uri.parse(url), headers: requestHeaders);
      log('RESPONSE : ${response.body}', name: LogLabel.httpGet);
      return Right(response);
    } catch (e, stktrc) {
      return Left(Failure(
          message: FailureMessage.getRequestMessage, stackTrace: stktrc));
    }
  }

  FutureEither<Response> postRequest(
      {required String url, dynamic body, bool requireAuth = true}) async {
    if (requireAuth) {
      if (_authToken.isNone()) {
        return Left(Failure(message: FailureMessage.authTokenEmpty));
      }
    }

    final tkn = _authToken.getOrElse(() => "");
    final Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Cookie": "token=$tkn",
    };

    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpPost);
      log('requireAuth : $requireAuth', name: LogLabel.httpPost);
      log('BODY : $body', name: LogLabel.httpPost);
    }
    try {
      final response = await post(Uri.parse(url),
          body: jsonEncode(body), headers: requestHeaders);
      log('RESPONSE : ${response.body}', name: LogLabel.httpPost);
      return Right(response);
    } catch (e, stktrc) {
      return Left(Failure(
          message: FailureMessage.postRequestMessage, stackTrace: stktrc));
    }
  }

  FutureEither<Response> putRequest(
      {required String url, dynamic body, bool requireAuth = true}) async {
    if (requireAuth) {
      if (_authToken.isNone()) {
        return Left(Failure(message: FailureMessage.authTokenEmpty));
      }
    }

    final tkn = _authToken.getOrElse(() => "");
    final Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Cookie": "token=$tkn"
    };

    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpPut);
      log(
        'requireAuth : $requireAuth',
        name: LogLabel.httpPut,
      );
      log('BODY : $body', name: LogLabel.httpPut);
    }
    try {
      final response = await put(Uri.parse(url),
          body: jsonEncode(body), headers: requestHeaders);
      log('RESPONSE : ${response.body}', name: LogLabel.httpPut);
      return Right(response);
    } catch (e, stktrc) {
      return Left(Failure(
          message: FailureMessage.putRequestMessage, stackTrace: stktrc));
    }
  }

  FutureEither<Response> deleteRequest(
      {required String url, dynamic body, bool requireAuth = true}) async {
    if (requireAuth) {
      if (_authToken.isNone()) {
        return Left(Failure(message: FailureMessage.authTokenEmpty));
      }
    }

    final tkn = _authToken.getOrElse(() => "");
    final Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Cookie": "token=$tkn"
    };

    if (AppConfig.logHttp) {
      log('REQUEST TO : $url', name: LogLabel.httpDelete);
      log('requireAuth : $requireAuth', name: LogLabel.httpDelete);
      log('BODY : $body', name: LogLabel.httpDelete);
    }
    try {
      final response = await delete(Uri.parse(url),
          body: jsonEncode(body), headers: requestHeaders);
      log('RESPONSE : ${response.body}', name: LogLabel.httpDelete);
      return Right(response);
    } catch (e, stktrc) {
      return Left(Failure(
          message: FailureMessage.deleteRequestMessage, stackTrace: stktrc));
    }
  }
}
