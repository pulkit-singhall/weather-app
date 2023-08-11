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
        elevation: 4.0,
        backgroundColor: Colors.red,
        toolbarHeight: 60,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Column( // main column
          children: [
            // main card
            SizedBox(
              width: double.infinity, // full screen
              child: Card(
                elevation: 3.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      Text(
                        "350 K",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 32,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Icon(
                        Icons.cloud,
                        size: 50,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text("Rain",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              color: Colors.black))
                    ],
                  ),
                ),
              ),
            ),
            // different time slots recycler view
            const SizedBox(
              height: 15,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Weather Forecast",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [

              ],
            ),
            const SizedBox(
              height: 15,
            ),
            // other details

          ],
        ),
      ),
    );
  }
}
