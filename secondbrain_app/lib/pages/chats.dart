import 'package:flutter/material.dart';
import 'package:secondbrain_app/utils/key_storage.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  String? _storedKey;

  @override
  void initState() {
    super.initState();
    _getKey();
  }

  Future<void> _getKey() async {
    final key = await KeyStorage.getKey();
    setState(() {
      _storedKey = key;
    });
    print(key); // just for debugging
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          _storedKey ?? "No key found",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
