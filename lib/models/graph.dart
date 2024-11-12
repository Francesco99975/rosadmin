import 'dart:convert';

import 'package:rosadmin/models/dataset.dart';
import 'package:rosadmin/models/pie.dart';

class GraphData {
  // ignore: constant_identifier_names
  static const DATA = "data";

  final Dataset data;

  GraphData({required this.data});

  GraphData copyWith({
    Dataset? data,
  }) {
    return GraphData(data: data ?? this.data);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{DATA: data};
  }

  factory GraphData.fromMap(Map<String, dynamic> map) {
    return GraphData(data: Dataset.fromMap(map[DATA]));
  }

  String toJson() => jsonEncode(toMap());

  factory GraphData.fromJson(String source) =>
      GraphData.fromMap(jsonDecode(source) as Map<String, dynamic>);
}

class MultiGraphData {
  // ignore: constant_identifier_names
  static const DATAPOINTS = "datapoints";

  final List<Dataset> datapoints;

  MultiGraphData({required this.datapoints});

  MultiGraphData copyWith({
    List<Dataset>? datapoints,
  }) {
    return MultiGraphData(datapoints: datapoints ?? this.datapoints);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{DATAPOINTS: datapoints};
  }

  factory MultiGraphData.fromMap(Map<String, dynamic> map) {
    return MultiGraphData(
        datapoints:
            (map[DATAPOINTS] as List).map((e) => Dataset.fromMap(e)).toList());
  }

  String toJson() => jsonEncode(toMap());

  factory MultiGraphData.fromJson(String source) =>
      MultiGraphData.fromMap(jsonDecode(source) as Map<String, dynamic>);
}

class GraphPie {
  // ignore: constant_identifier_names
  static const PIE = "pie";

  final Pie pie;

  GraphPie({required this.pie});

  GraphPie copyWith({
    Pie? pie,
  }) {
    return GraphPie(pie: pie ?? this.pie);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{PIE: pie};
  }

  factory GraphPie.fromMap(Map<String, dynamic> map) {
    return GraphPie(pie: Pie.fromMap(map[PIE]));
  }

  String toJson() => jsonEncode(toMap());

  factory GraphPie.fromJson(String source) =>
      GraphPie.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
