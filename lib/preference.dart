import 'package:flutter/material.dart';

class Preference extends StatelessWidget {
  const Preference({super.key});

  @override
  Widget build(BuildContext context) {
    final Border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        width: 2,
        style: BorderStyle.solid,
        color: Colors.red,
      ),
    );

    final city = TextEditingController();
    final country = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Check Your Daily Weather",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                    fontSize: 30),
                maxLines: 2,
              ),
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 100,
                width: 350,
                child: TextField(
                  controller: city,
                  decoration: InputDecoration(
                    labelText: "City",
                    labelStyle: const TextStyle(
                      fontSize: 18,
                    ),
                    border: Border,
                    disabledBorder: Border,
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                width: 350,
                child: TextField(
                  controller: country,
                  decoration: InputDecoration(
                    labelText: "Country",
                    labelStyle: const TextStyle(
                      fontSize: 18,
                    ),
                    border: Border,
                    disabledBorder: Border,
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  elevation: MaterialStateProperty.all(3.0),
                  fixedSize: MaterialStateProperty.all<Size>(const Size(140,45)),

                ),
                child: const Text(
                  "Check",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
