import 'package:flutter/material.dart';
import 'package:rosadmin/models/visit.dart';
import 'package:rosadmin/widgets/card_list.dart';

class TrafficStandings extends StatelessWidget {
  final List<VisitOrigin> visitOrigins;
  final List<DeviceOrigin> deviceOrigins;

  const TrafficStandings(
      {super.key, required this.visitOrigins, required this.deviceOrigins});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CardList(
            title: 'Arriving From',
            items: visitOrigins.map((e) => '${e.sauce} - ${e.count}').toList(),
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: CardList(
            title: 'Devices Used',
            items: deviceOrigins
                .map((e) => '${e.deviceSignature} - ${e.count}')
                .toList(),
          ),
        ),
      ],
    );
  }
}
