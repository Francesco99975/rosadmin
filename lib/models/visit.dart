// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:rosadmin/models/dataset.dart';

class VisitOrigin {
  final String sauce;
  final int count;

  VisitOrigin({required this.sauce, required this.count});

  VisitOrigin copyWith({String? sauce, int? count}) {
    return VisitOrigin(sauce: sauce ?? this.sauce, count: count ?? this.count);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sauce': sauce,
      'count': count,
    };
  }

  factory VisitOrigin.fromMap(Map<String, dynamic> map) {
    return VisitOrigin(sauce: map['sauce'], count: map['count']);
  }

  String toJson() => jsonEncode(toMap());

  factory VisitOrigin.fromJson(String source) =>
      VisitOrigin.fromMap(jsonDecode(source) as Map<String, dynamic>);
}

class DeviceOrigin {
  final String deviceSignature;
  final int count;

  DeviceOrigin({required this.deviceSignature, required this.count});

  DeviceOrigin copyWith({String? deviceSignature, int? count}) {
    return DeviceOrigin(
        deviceSignature: deviceSignature ?? this.deviceSignature,
        count: count ?? this.count);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'device_signature': deviceSignature,
      'count': count,
    };
  }

  factory DeviceOrigin.fromMap(Map<String, dynamic> map) {
    return DeviceOrigin(
        deviceSignature: map['device_signature'], count: map['count']);
  }

  String toJson() => jsonEncode(toMap());

  factory DeviceOrigin.fromJson(String source) =>
      DeviceOrigin.fromMap(jsonDecode(source) as Map<String, dynamic>);
}

class Visit {
  static const CURRENT = "current";
  static const TOTAL_VIEWS = "total_views";
  static const BOUNCE_RATE = "bounce_rate";
  static const AVG_VISIT_DURATION = "avg_visit_duration";
  static const TOTAL_VISITS = "total_visits";
  static const TOTAL_UNIQUE_VISITORS = "total_unique_visitors";
  static const VISIT_ORIGINS = "visit_origins";
  static const DEVICE_ORIGINS = "device_origins";
  static const DATA = "data";

  final int current;
  final int totalViews;
  final String bounceRate;
  final int avgVisitDuration;
  final int totalVisitors;
  final int totalUniqueVisitors;
  final List<VisitOrigin> visitOrigins;
  final List<DeviceOrigin> deviceOrigins;
  final Dataset data;

  Visit(
      {required this.current,
      required this.totalViews,
      required this.bounceRate,
      required this.avgVisitDuration,
      required this.totalVisitors,
      required this.totalUniqueVisitors,
      required this.visitOrigins,
      required this.deviceOrigins,
      required this.data});

  Visit copyWith({
    int? current,
    int? totalViews,
    String? bounceRate,
    int? avgVisitDuration,
    int? totalVisitors,
    int? totalUniqueVisitors,
    List<VisitOrigin>? visitOrigins,
    List<DeviceOrigin>? deviceOrigins,
    Dataset? data,
  }) {
    return Visit(
        current: current ?? this.current,
        totalViews: totalViews ?? this.totalViews,
        bounceRate: bounceRate ?? this.bounceRate,
        avgVisitDuration: avgVisitDuration ?? this.avgVisitDuration,
        totalVisitors: totalVisitors ?? this.totalVisitors,
        totalUniqueVisitors: totalUniqueVisitors ?? this.totalUniqueVisitors,
        visitOrigins: visitOrigins ?? this.visitOrigins,
        deviceOrigins: deviceOrigins ?? this.deviceOrigins,
        data: data ?? this.data);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      CURRENT: current,
      TOTAL_VIEWS: totalViews,
      BOUNCE_RATE: bounceRate,
      AVG_VISIT_DURATION: avgVisitDuration,
      TOTAL_VISITS: totalVisitors,
      TOTAL_UNIQUE_VISITORS: totalUniqueVisitors,
      VISIT_ORIGINS: visitOrigins,
      DEVICE_ORIGINS: deviceOrigins,
      DATA: data
    };
  }

  factory Visit.fromMap(Map<String, dynamic> map) {
    return Visit(
        current: map[CURRENT],
        totalViews: map[TOTAL_VIEWS],
        bounceRate: map[BOUNCE_RATE],
        avgVisitDuration: map[AVG_VISIT_DURATION],
        totalVisitors: map[TOTAL_VISITS],
        totalUniqueVisitors: map[TOTAL_UNIQUE_VISITORS],
        visitOrigins: (map[VISIT_ORIGINS] as List<dynamic>)
            .map((e) => VisitOrigin.fromMap(e))
            .toList(),
        deviceOrigins: (map[DEVICE_ORIGINS] as List<dynamic>)
            .map((e) => DeviceOrigin.fromMap(e))
            .toList(),
        data: Dataset.fromMap(map[DATA]));
  }

  String toJson() => jsonEncode(toMap());

  factory Visit.fromJson(String source) =>
      Visit.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
