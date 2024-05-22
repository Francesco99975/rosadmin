import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerDetailsScreen extends StatelessWidget {
  static const routePath = "/customers/detail";

  final String fullName;
  final String email;
  final String address;
  final String phone;
  final DateTime created;
  final DateTime lastOrdered;
  final double totalSpent;

  const CustomerDetailsScreen({
    super.key,
    required this.fullName,
    required this.email,
    required this.address,
    required this.phone,
    required this.created,
    required this.lastOrdered,
    required this.totalSpent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const Text(
                    'Full Name:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(fullName),
                  const SizedBox(height: 16),
                  _buildClickableField(
                      'Email:', email, () => _launchEmail(email)),
                  const SizedBox(height: 16),
                  _buildClickableField(
                      'Address:', address, () => _launchMap(address)),
                  const SizedBox(height: 16),
                  _buildClickableField(
                      'Phone:', phone, () => _launchPhone(phone)),
                  const SizedBox(height: 16),
                  const Text(
                    'Date Created:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(created.toString()),
                  const SizedBox(height: 16),
                  const Text(
                    'Date of Last Order:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(lastOrdered.toString()),
                  const SizedBox(height: 16),
                  const Text(
                    'Total Spent:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(totalSpent.toString()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClickableField(String label, String value, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  void _launchEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    await launchUrl(emailLaunchUri);
  }

  void _launchPhone(String phone) async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    await launchUrl(phoneLaunchUri);
  }

  void _launchMap(String address) async {
    final Uri mapLaunchUri = Uri(
      scheme: 'https',
      host: 'www.google.com',
      path: 'maps/search/',
      queryParameters: {'q': address},
    );
    await launchUrl(mapLaunchUri);
  }
}
