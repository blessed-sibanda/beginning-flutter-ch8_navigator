import 'package:flutter/material.dart';
import 'about.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _howAreYou = '...';

  void _openAboutPage({
    required BuildContext context,
    bool fullScreenDialog = false,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullScreenDialog,
        builder: (context) => const About(),
      ),
    );
  }

  void _openGratitudePage({
    required BuildContext context,
  }) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              _openAboutPage(context: context, fullScreenDialog: true);
            },
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Grateful for : $_howAreYou',
          style: const TextStyle(fontSize: 32.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openGratitudePage(context: context),
        child: const Icon(Icons.sentiment_satisfied),
        tooltip: 'About',
      ),
    );
  }
}
