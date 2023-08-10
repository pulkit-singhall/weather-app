import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 2.0,
        backgroundColor: Colors.red,
        toolbarHeight: 60,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: const Column(

      ),
    );
  }
}
