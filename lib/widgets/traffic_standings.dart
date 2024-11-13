import 'package:flutter/material.dart';
import 'package:rosadmin/models/standing.dart';
import 'package:rosadmin/models/visit.dart';
import 'package:rosadmin/widgets/card_list.dart';

class TrafficStandings extends StatelessWidget {
  final List<VisitOrigin> visitOrigins;
  final List<DeviceOrigin> deviceOrigins;

  const TrafficStandings({
    super.key,
    required this.visitOrigins,
    required this.deviceOrigins,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 16.0, // Horizontal space between items
        runSpacing: 16.0, // Vertical space between items when wrapping
        alignment: WrapAlignment.spaceBetween, // Centers items in the main axis
        children: [
          Container(
            constraints:
                BoxConstraints(maxWidth: 400), // Maximum width constraint
            child: CardList(
              title: 'Arriving From',
              items: visitOrigins
                  .map(
                      (e) => Standing(name: e.sauce, value: e.count.toString()))
                  .toList(),
            ),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 400),
            child: CardList(
              title: 'Devices Used',
              items: deviceOrigins
                  .map((e) => Standing(
                      name: e.deviceSignature, value: e.count.toString()))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
