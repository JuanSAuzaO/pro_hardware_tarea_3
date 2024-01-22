import 'package:flutter/material.dart';
import '../layouts/data_box.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
    this.name,
    this.description,
    this.priceCents,
    { super.key }
  );

  final String name;

  final String description;

  final int priceCents;

  @override

  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: const Color(0xFF2980b9),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 297,
                child: Align(
                  alignment: Alignment.center,
                  child: DataBox(name)
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 297,
                child: Align(
                  alignment: Alignment.center,
                  child: DataBox(description)
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Apply same rules as above but now passing in the record value
              //in the DataBox
              SizedBox(
                width: 297,
                child: Align(
                    alignment: Alignment.center,
                    child: DataBox('\$${priceCents/100}')
                ),
              ),
            ],
          ),
          const SizedBox(height: 10)
        ]
      )
    );
  }
}