import 'package:flutter/material.dart';
import 'package:secondbrain_app/utils/key_storage.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String? _storedKey;

  Future<void> _getKey() async {
    final key = await KeyStorage.getKey();
    setState(() {
      _storedKey = key;
    });
  }

  Future<void> _saveKey() async {
    final newKey = _keyController.text.trim();
    if (newKey.isNotEmpty) {
      //initially test if api key is working else return and throw error.
      await KeyStorage.saveKey(newKey);
      if (!mounted) return;
      setState(() {
        _storedKey = newKey;
      });
      _keyController.clear();
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("API Key saved succesfully")),
      );
    }
  }

  String getMaskedKey(String key) {
    if (key.length <= 4) return key;
    return "${key.substring(0, 4)}XX...XX${key.substring(key.length - 4, key.length)}";
  }

  final TextEditingController _keyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'), centerTitle: false),
      body: ListView(
        children: [
          ExpansionTile(
            title: Text('Account Details'),
            subtitle: Text('Coming Soon'),
            children: [],
            enabled: false,
          ),
          ExpansionTile(
            title: Text('Usage & Analytics'),
            children: [],
            subtitle: Text('Coming Soon'),
            enabled: false,
          ),
          ExpansionTile(
            title: Text('Preferences'),
            children: [],
            subtitle: Text('Coming Soon'),
            enabled: false,
          ),
          ExpansionTile(
            title: Text('API Integrations'),
            subtitle: Text('Manage API Keys'),
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Paste Your Gemini API Key here',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text('This will Overwrite the existing keys'),
                    SizedBox(height: 20),
                    if (_storedKey != null) ...[
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Stored Key: ${getMaskedKey(_storedKey!)}",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                    Padding(
                      padding: EdgeInsets.all(18),
                      child: TextField(
                        controller: _keyController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Paste Key Here',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        print('Button press registered');
                        _saveKey();
                      },
                      child: Text('Verify and Save'),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Text('Support'),
            subtitle: Text('Coming Soon'),
            enabled: false,
            children: [
              ListTile(title: Text('FAQ (Common Issues)')),
              ListTile(title: Text('Write Feedback')),
            ],
          ),
        ],
      ),
    );
  }
}
