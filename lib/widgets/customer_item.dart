import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rosadmin/models/customer.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerItem extends StatelessWidget {
  final Customer customer;

  const CustomerItem({
    super.key,
    required this.customer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: ListTile(
        onLongPress: () => context.pushNamed(
          'costumer_detail',
          queryParameters: {'customer': customer.toJson()},
        ),
        title: Text(
          customer.fullname,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(customer.email),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                Icons.email,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () async {
                final url = Uri.parse('mailto:${customer.email}');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
            ),
            IconButton(
              icon: Icon(
                Icons.phone,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                _showConfirmationDialog(context, customer.phone);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, String phoneNumber) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Call"),
          content: Text("Are you sure you want to call $phoneNumber?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                final url = Uri.parse('tel:$phoneNumber');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              child: const Text("Call"),
            ),
          ],
        );
      },
    );
  }
}
