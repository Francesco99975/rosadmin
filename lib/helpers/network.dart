import 'dart:convert';
import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:option_result/option.dart' as rs;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rosadmin/helpers/failure.dart';
import 'package:rosadmin/helpers/types.dart';
import 'package:rosadmin/models/user.dart';
import 'package:rosadmin/providers/user.dart';
import 'package:rosadmin/res/strings.dart';
import 'package:rosadmin/utils/config.dart';
import 'package:http/http.dart';

part 'network.g.dart';

@riverpod
class Network extends _$Network {
  @override
  NetworkRepo build() {
    final user = ref.watch(userxProvider);

    return switch (user.value) {
      rs.Some<User>(:final value) =>
        NetworkRepo(authToken: rs.Some<String>(value.token)),
      rs.None<User>() => NetworkRepo(authToken: const rs.None<String>()),
      null => NetworkRepo(authToken: const rs.None<String>()),
    };
  }
}

class NetworkRepo {
  final rs.Option<String> _authToken;

  NetworkRepo({required rs.Option<String> authToken}) : _authToken = authToken;

  FutureEither<Response> getRequest(param0, bool bool,
      {required String url, bool requireAuth = true}) async {
    final Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Cookie": "token=$_authToken"
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

    final tkn = _authToken.unwrapOr("");
    final Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Cookie": "token=$tkn"
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

    final tkn = _authToken.unwrapOr("");
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

    final tkn = _authToken.unwrapOr("");
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
