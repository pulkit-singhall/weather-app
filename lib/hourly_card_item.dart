import 'package:flutter/material.dart';

class HourlyCard extends StatelessWidget {
  // constructor
  final String temp;
  final icon;
  final String time;

  const HourlyCard({super.key,
    required this.temp,
    required this.icon,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
          child: Column(
            children: [
              Text(
                temp,
                style: const TextStyle(
                    color: Color.fromARGB(255, 53, 52, 52),
                    fontSize: 28,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Icon(
                icon,
                  color: const Color.fromARGB(255, 53, 52, 52),
                size: 40,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                time,
                style: const TextStyle(
                    color: Color.fromARGB(255, 53, 52, 52),
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}