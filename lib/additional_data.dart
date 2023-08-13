import 'package:flutter/material.dart';

class AdditionalDetail extends StatelessWidget {
  // constructor to pass different values
  final IconData icon;
  final String measure;
  final String value;

  const AdditionalDetail({
    super.key,
    required this.icon,
    required this.measure,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            size: 45,
            color: const Color.fromARGB(255, 53, 52, 52),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            measure,
            style:
                const TextStyle(fontSize: 22, color: Color.fromARGB(255, 53, 52, 52)),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            value,
            style:
                const TextStyle(fontSize: 25, color: Color.fromARGB(255, 53, 52, 52)),
          ),
        ],
      ),
    );
  }
}
