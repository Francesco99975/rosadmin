import 'package:flutter/material.dart';
import 'package:rosadmin/models/standing.dart';
import 'package:rosadmin/widgets/standings_item.dart';

class CardList extends StatelessWidget {
  final String title;
  final List<Standing> items;
  final bool ordered;

  const CardList(
      {super.key,
      required this.title,
      required this.items,
      this.ordered = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(),
          items.isEmpty
              ? Center(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    color: Theme.of(context).colorScheme.surface,
                    child: Text(
                      'NOT ENOUGH DATA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ordered
                        ? OrderedStandingItem(
                            index: index,
                            name: items[index].name,
                            value: items[index].value)
                        : UnorderedStandingItem(
                            name: items[index].name, value: items[index].value);
                  },
                ),
        ],
      ),
    );
  }
}
