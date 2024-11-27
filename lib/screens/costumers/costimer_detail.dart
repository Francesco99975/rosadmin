import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rosadmin/models/customer.dart';
import 'package:rosadmin/utils/formatters.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerDetailsScreen extends StatelessWidget {
  static const routePath = "/customers/detail";

  final Customer customer;

  const CustomerDetailsScreen({
    super.key,
    required this.customer,
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
                context.pop();
              },
            ),
            title: const Text('Customer Details'),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const Text(
                    'Full Name:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(customer.fullname,
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary)),
                  const SizedBox(height: 16),
                  _buildClickableField('Email:', customer.email,
                      () => _launchEmail(customer.email), context),
                  const SizedBox(height: 16),
                  _buildClickableField('Address:', customer.address,
                      () => _launchMap(customer.address), context),
                  const SizedBox(height: 16),
                  _buildClickableField('Phone:', customer.phone,
                      () => _launchPhone(customer.phone), context),
                  const SizedBox(height: 16),
                  const Text(
                    'Date Created:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(DateFormat.yMMMMEEEEd().format(customer.created),
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary)),
                  const SizedBox(height: 16),
                  const Text(
                    'Date of Last Order:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(DateFormat.yMMMMEEEEd().format(customer.lastOrdered),
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary)),
                  const SizedBox(height: 16),
                  const Text(
                    'Total Spent:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(moneyFormatter.format(customer.totalSpent / 100.0),
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClickableField(
      String label, String value, VoidCallback onTap, BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            value,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              decoration: TextDecoration.underline,
              fontSize: 16,
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
