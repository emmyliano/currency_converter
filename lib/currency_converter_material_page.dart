import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0;

  final TextEditingController amountController = TextEditingController();
  // ignore: non_constant_identifier_names
  double dollar_to_naira_rate_now = 1413.0172;
  String lastUpdate = 'Last Update: 2024-3-21 15:07';

  void convert() {
    setState(() {
      String input = amountController.text.trim();
      if (input.isNotEmpty && double.tryParse(input) != null) {
        result = double.parse(input) * dollar_to_naira_rate_now;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Dollar to Naira Exchange rate at $lastUpdate is $dollar_to_naira_rate_now'),
          ),
        );
      } else {
        result = 0;
        // display an error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter a valid number'),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'NGN ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}',
                // result.toString(),
                style: const TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.2),
                child: SizedBox(
                  width: double.infinity,
                  child: TextField(
                    controller: amountController,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Please enter the amount in USD',
                      hintStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      prefixIcon: const Icon(Icons.monetization_on_outlined),
                      prefixIconColor: Colors.black,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: convert,
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.black),
                      foregroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                      minimumSize: const MaterialStatePropertyAll(
                        Size(double.infinity, 50),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      )),
                  child: const Text('Convert'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
