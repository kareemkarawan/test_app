import 'package:flutter/material.dart';
import '../models/worker.dart';
import '../theme/app_text.dart';

class WorkerCard extends StatelessWidget {
  final Worker worker;

  const WorkerCard({super.key, required this.worker});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          debugPrint(worker.name);
        },
        borderRadius: BorderRadius.circular(20),
        child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(radius: 20, child: Icon(Icons.person)),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              border: Border.all(color: Colors.white, width: 2),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(worker.name, style: AppText.cardTitle),
                          SizedBox(height: 10),
                          Text(worker.profession),
                          SizedBox(height: 10),
                          Text("${worker.experience} years of experience"),
                        ],
                      ),
                    ),
                    Text("⭐ ${worker.rating}"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
