import 'package:flutter/material.dart';

class WorkerListScreen extends StatelessWidget {
    final String serviceName;

    const WorkerListScreen({
        super.key,
        required this.serviceName,
    });

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(serviceName),
            ),
            body: Center(
                child: Text(
                    "Workers for $serviceName",
                    style: const TextStyle(fontSize: 24),
                ),
            ),
        );
    }
}