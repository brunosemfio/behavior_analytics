import 'package:behavior_analytics/behavior_analytics.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? _sessionId;

  @override
  void initState() {
    super.initState();
    BehaviorAnalytics.start('');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('session id: $_sessionId'),
              TextButton(
                onPressed: () {
                  BehaviorAnalytics.generateSessionId().then(
                      (sessionId) => setState(() => _sessionId = sessionId));
                },
                child: const Text('generate session id'),
              ),
              TextButton(
                onPressed: () {
                  if (_sessionId != null) {
                    BehaviorAnalytics.collectDeviceInfo(_sessionId!);
                  }
                },
                child: const Text('collect device info'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
