import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: _darkModeEnabled,
            onChanged: (value) {
              setState(() {
                _darkModeEnabled = value;
                // You can add logic to enable/disable dark mode here
              });
            },
          ),
          ListTile(
            title: const Text('Notifications'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to the notifications settings page
              // You can use Navigator.push to navigate to another page
              // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsSettingsPage()));
            },
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to the privacy policy page
              // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyPage()));
            },
          ),
          ListTile(
            title: const Text('Terms of Service'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to the terms of service page
              // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => TermsOfServicePage()));
            },
          ),
          // Add more settings options as needed
        ],
      ),
    );
  }
}

// Example of a settings page that can be navigated to
class NotificationsSettingsPage extends StatelessWidget {
  const NotificationsSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications Settings'),
      ),
      body: Center(
        child: const Text('Notifications Settings Page'),
      ),
    );
  }
}
