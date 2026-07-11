import 'package:flutter/material.dart';
import '../models/worker.dart';

class WorkerCard extends StatelessWidget {
  final Worker worker;
  final VoidCallback onTap;

  const WorkerCard({super.key, required this.worker, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: Text(worker.name),
        subtitle: Text(
          "${worker.profession}\n${worker.experience} years experience",
        ),
        trailing: Text("${worker.rating}"),
        isThreeLine: true,
        onTap: onTap,
      ),
    );
  }
}
