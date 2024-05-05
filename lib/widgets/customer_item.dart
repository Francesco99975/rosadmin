import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerItem extends StatelessWidget {
  final String fullName;
  final String email;
  final String phoneNumber;

  const CustomerItem({
    super.key,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        // Go to customer detail
      },
      title: Text(
        fullName,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(email),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.email),
            onPressed: () async {
              final url = Uri.parse('mailto:$email');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.phone),
            onPressed: () {
              _showConfirmationDialog(context, phoneNumber);
            },
          ),
        ],
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
