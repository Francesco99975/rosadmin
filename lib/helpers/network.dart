import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:mime/mime.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rosadmin/helpers/failure.dart';
import 'package:rosadmin/helpers/types.dart';
import 'package:rosadmin/providers/user.dart';
import 'package:rosadmin/res/strings.dart';
import 'package:rosadmin/utils/config.dart';
import 'package:http_parser/http_parser.dart';
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
      _ => Left(Failure(message: "Network responding unexpectedly"))
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
          message: "${FailureMessage.getRequestMessage}: ${e.toString()}",
          stackTrace: stktrc));
    }
  }

  FutureEither<Response> postRequest(
      {required String url,
      dynamic body,
      bool multipart = false,
      bool requireAuth = true}) async {
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
      if (!multipart) {
        final response = await post(Uri.parse(url),
            body: jsonEncode(body), headers: requestHeaders);
        log('RESPONSE : ${response.body}', name: LogLabel.httpPost);
        return Right(response);
      } else {
        var request = MultipartRequest('POST', Uri.parse(url));
        (body as Map<String, dynamic>).forEach((key, value) {
          if (key != "file") {
            request.fields[key] = value; //Does't like this
          } else {
            var fileData = File(value).readAsBytesSync();
            var mime = lookupMimeType(value);
            request.files.add(MultipartFile.fromBytes(value, fileData,
                contentType: MediaType(mime!.substring(0, mime.indexOf("/")),
                    mime.substring(mime.indexOf("/") + 1)),
                filename: value.split("/").last));
          }
        });

        final response = await Response.fromStream(await request.send());

        return Right(response);
      }
    } catch (e, stktrc) {
      return Left(Failure(
          message: "${FailureMessage.postRequestMessage}: ${e.toString()}",
          stackTrace: stktrc));
    }
  }

  FutureEither<Response> putRequest(
      {required String url,
      dynamic body,
      bool multipart = false,
      bool requireAuth = true}) async {
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
      if (!multipart) {
        final response = await put(Uri.parse(url),
            body: jsonEncode(body), headers: requestHeaders);
        log('RESPONSE : ${response.body}', name: LogLabel.httpPut);
        return Right(response);
      } else {
        var request = MultipartRequest('PUT', Uri.parse(url));
        (body as Map<String, dynamic>).forEach((key, value) {
          if (key != "file") {
            request.fields[key] = value.toString();
          } else {
            var fileData = File(value).readAsBytesSync();
            var mime = lookupMimeType(value);
            request.files.add(MultipartFile.fromBytes(value, fileData,
                contentType: MediaType(mime!.substring(0, mime.indexOf("/")),
                    mime.substring(mime.indexOf("/") + 1)),
                filename: value.split("/").last));
          }
        });

        final response = await Response.fromStream(await request.send());

        return Right(response);
      }
    } catch (e, stktrc) {
      return Left(Failure(
          message: "${FailureMessage.putRequestMessage}: ${e.toString()}",
          stackTrace: stktrc));
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
          message: "${FailureMessage.deleteRequestMessage}: ${e.toString()}",
          stackTrace: stktrc));
    }
  }
}
