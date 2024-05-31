import 'package:flutter/material.dart';

class AddContainer extends StatelessWidget {
  const AddContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 190,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://images-eu.ssl-images-amazon.com/images/G/31/img16/Grocery/Jupiter19/Wave1/Coop/750x375.jpg")),
          borderRadius: BorderRadius.all(Radius.circular(13))),
    );
  }
}
