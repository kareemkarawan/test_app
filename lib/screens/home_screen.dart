import 'package:flutter/material.dart';
import '../widgets/service_card.dart';
import '../models/service.dart';
import '../screens/worker_list_screen.dart';
import '../theme/app_text.dart';
import '../models/worker.dart';
import '../widgets/worker_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String getGreeting() {
  final hour = DateTime.now().hour;
  if (hour < 12) {
    return "Good Morning,";
  } else if (hour < 18) {
    return "Good Afteroon,";
  } else {
    return "Good Evening,";
  }
}

class _HomeScreenState extends State<HomeScreen> {
  String searchText = "";
  String greeting = "Hello Kareem";

  final service = [
    const Service(
      title: "Private Driver",
      description: "Hire trusted drivers for your family",
      icon: Icons.directions_car,
    ),
    const Service(
      title: "Nanny",
      description: "Hire trusted nannies for your family",
      icon: Icons.child_care,
    ),
    const Service(
      title: "Housekeeper",
      description: "Hire trusted housekeepers for your family",
      icon: Icons.cleaning_services,
    ),
    const Service(
      title: "Chef",
      description: "Hire trusted chefs for your family",
      icon: Icons.restaurant,
    ),
  ];
  final fakeworkers = [
    const Worker(
      name: "Mohammad Salah",
      profession: "Driver",
      experience: 8,
      rating: 4.9,
      verified: true,
    ),
    const Worker(
      name: "Zico",
      profession: "Driver",
      experience: 3,
      rating: 4.7,
      verified: false,
    ),
    const Worker(
      name: "Mostafa Shobeir",
      profession: "Chef",
      experience: 2,
      rating: 4.8,
      verified: true,
    ),
    const Worker(
      name: "Kareem Karawan",
      profession: "Nanny",
      experience: 23,
      rating: 5.0,
      verified: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(getGreeting(), style: AppText.subtitle),

                        const SizedBox(height: 5),

                        Text("Kareem", style: AppText.heading),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_none),
                        ),

                        const CircleAvatar(
                          radius: 20,
                          child: Icon(Icons.person),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  "Find trusted help\nfor your home",
                  style: AppText.heading,
                ),
                const SizedBox(height: 30),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Services...",
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchText = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 15),
                Stack(
                  children: [
                    const Icon(Icons.heart_broken, size: 35),
                    Positioned(
                      right: 0,
                      top: 0,

                      child: Container(
                        width: 11,
                        height: 11,

                        decoration: BoxDecoration(
                          color: Colors.red,
                          border: Border.all(color: Colors.white, width: 1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
                // InkWell(
                //   onTap: () {
                //     print("tapped");
                //   },
                //   child: Container(
                //     padding: const EdgeInsets.all(15),
                //     decoration: BoxDecoration(
                //       color: Theme.of(context).colorScheme.primary,
                //       borderRadius: BorderRadius.circular(15),
                //     ),
                //     child: const Icon(Icons.tune, color: Colors.white),
                //   ),
                // ),
              ],
            ),

            SizedBox(height: 30),
            Text("Services", style: AppText.cardTitle),

            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 25),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF0F766E), Color(0xFF14B8A6)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Need a driver?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Book trusted professionals in minutes!",
                    style: TextStyle(
                      color: Color.fromARGB(197, 255, 255, 255),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.teal,
                    ),
                    child: const Text("Book Now"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            ...service
                .where((service) {
                  return service.title.toLowerCase().contains(
                    searchText.toLowerCase(),
                  );
                })
                .map((service) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: ServiceCard(
                      title: service.title,
                      description: service.description,
                      icon: service.icon,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WorkerListScreen(serviceName: service.title),
                          ),
                        );
                      },
                    ),
                  );
                }),
            SizedBox(height: 30),
            Text("Featured Workers", style: AppText.cardTitle),
            SizedBox(height: 20),

            ...fakeworkers.map((fakeworkers) {
              return WorkerCard(worker: fakeworkers);
            }),
          ],
        ),
      ),
    );
  }
}
