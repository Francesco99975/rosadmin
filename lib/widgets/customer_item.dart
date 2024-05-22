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
        onLongPress: () =>
            context.pushNamed('customer_detail', queryParameters: {
          'id': customer.id,
          'name': customer.fullname,
          'email': customer.email,
          'address': customer.address,
          'phone': customer.phone,
          'created': customer.created.toIso8601String(),
          'last_ordered': customer.lastOrdered.toIso8601String(),
          'total_spent': (customer.totalSpent / 100).toString(),
        }),
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
              icon: const Icon(Icons.email),
              onPressed: () async {
                final url = Uri.parse('mailto:${customer.email}');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
            ),
            IconButton(
              icon: const Icon(Icons.phone),
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
