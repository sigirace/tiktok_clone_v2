import 'package:flutter/material.dart';
import 'package:tiktok_clone_v2/constants/font_size.dart';

class StfScreen extends StatefulWidget {
  const StfScreen({super.key});

  @override
  State<StfScreen> createState() => _StfScreenState();
}

class _StfScreenState extends State<StfScreen> {
  int _clicks = 0;

  void _increment() {
    setState(() {
      _clicks++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'StfScreen',
            style: TextStyle(fontSize: FontSizes.size30),
          ),
          Text(
            '$_clicks',
            style: TextStyle(fontSize: FontSizes.size30),
          ),
          ElevatedButton(
            onPressed: _increment,
            child: const Text('Increment'),
          ),
        ],
      ),
    );
  }
}
