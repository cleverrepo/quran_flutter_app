import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamversehub/variables/constant_variables.dart';

import 'home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Card(
              elevation: 20,
              color: maiColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(19),
                      bottomRight: Radius.circular(19))),
              child: Image.asset("Assets/images/quran.png"),
            ),
            const Spacer(),

            Text(
              "Learn Quran and read everyday",
              style: GoogleFonts.montserratAlternates(
                fontSize: fontSize,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const HomeScreen(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 100));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: maiColor,
                  elevation: 20,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: Text(
                "Get Started",
                style: GoogleFonts.montserratAlternates(
                    fontSize: fontSize, color: secondaryColor),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
