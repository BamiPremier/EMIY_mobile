import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text(
              'Notifications',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            subtitle: Text(
              notificationsEnabled ? 'Activées' : 'Désactivées',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            value: notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                notificationsEnabled = value;
              });
            },
          ),
          ListTile(
            title: Text(
              'Confidentialité',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            subtitle: Text(
              'Voir la politique de confidentialité',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: const Icon(Icons.arrow_right),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Version',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            trailing: const Icon(Icons.arrow_right),
            subtitle: Text(
              '1.0.0',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
