// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery_app/features/profile_Page/widgets/custom_container.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 19, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg")),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                  SizedBox(height: 50),
                  CustomContainer(text: "Favorites"),
                  SizedBox(
                    height: 15,
                  ),
                  CustomContainer(text: "Cart"),
                  SizedBox(
                    height: 15,
                  ),
                  CustomContainer(text: "My Orders"),
                  SizedBox(
                    height: 15,
                  ),
                  CustomContainer(text: "Personal Information"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
