import 'package:flutter/material.dart';
import '../widgets/service_card.dart';
import '../models/service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Household"),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            SizedBox(height:10),
            Text("Find trusted help for your home."),
            Text(greeting),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                hintText: "Search drivers",
                prefixIcon: Icon(Icons.person),
                border: UnderlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
            SizedBox(height:10),
            Text("Search: $searchText",),
            SizedBox(height:10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  greeting = greeting == "Hello Kareem"
                    ? "Welcome Back!"
                    : "Hello Kareem";
                });
              },
              child: Text("Toggle Greeting"),
            ),
            SizedBox(height:20),

            ...service
              .where((service) {
                return service.title
                  .toLowerCase()
                  .contains(searchText.toLowerCase());
              })
              .map((service) {
              return Padding(
                padding: const EdgeInsets.only(bottom:15),
                child: ServiceCard(
                  title: service.title,
                  description: service.description,
                  icon:service.icon,
                  onTap: () {
                    print(service.title);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}