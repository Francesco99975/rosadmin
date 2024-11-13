import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rosadmin/providers/setters.dart';
import 'package:rosadmin/utils/snackbar_service.dart';
import 'package:rosadmin/widgets/async_provider_comparer.dart';
import 'package:rosadmin/widgets/main_appbar.dart';
import 'package:rosadmin/widgets/main_drawer.dart';

class SettingsScreen extends ConsumerWidget {
  static const routePath = "/settings";

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: MainAppBar(title: "Settings"),
      drawer: const MainDrawer(
        active: SettingsScreen.routePath,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AsyncProviderComparer(
              provider: onlineProvider,
              future: onlineProvider.future,
              render: (online) => SwitchListTile(
                title: const Text('Website Online'),
                value: online, // or false depending on state
                onChanged: (newValue) async {
                  final res =
                      await ref.read(onlineProvider.notifier).set(newValue);

                  res.match(
                      (l) => SnackBarService.showNegativeSnackBar(
                          context: context, message: l.message),
                      (online) => SnackBarService.showPositiveSnackBar(
                          context: context,
                          message: online
                              ? "Website is now online"
                              : "Website is now offline"));
                },
              ),
            ),
            const SizedBox(height: 10),
            AsyncProviderComparer(
              provider: operativeProvider,
              future: operativeProvider.future,
              render: (operative) => SwitchListTile(
                title: const Text('Website Operative'),
                value: operative, // or false depending on state
                onChanged: (newValue) async {
                  final res =
                      await ref.read(operativeProvider.notifier).set(newValue);

                  res.match(
                      (l) => SnackBarService.showNegativeSnackBar(
                          context: context, message: l.message),
                      (operative) => SnackBarService.showPositiveSnackBar(
                          context: context,
                          message: operative
                              ? "Website is now operative"
                              : "Website is now not operative"));
                },
              ),
            ),
            const SizedBox(height: 20),
            MessageForm(),
          ],
        ),
      ),
    );
  }
}

class MessageForm extends ConsumerStatefulWidget {
  const MessageForm({super.key});

  @override
  ConsumerState<MessageForm> createState() => _MessageFormState();
}

class _MessageFormState extends ConsumerState<MessageForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return AsyncProviderComparer(
        provider: messageLineProvider,
        future: messageLineProvider.future,
        render: (message) {
          _messageController.text = message;
          return Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Floating Message Content',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  maxLines: 5,
                  controller: _messageController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final res = await ref
                          .read(messageLineProvider.notifier)
                          .set(_messageController.text);

                      res.match(
                          (l) => SnackBarService.showNegativeSnackBar(
                              context: context, message: l.message),
                          (online) => SnackBarService.showPositiveSnackBar(
                              context: context, message: "Message updated"));
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          );
        });
  }
}
