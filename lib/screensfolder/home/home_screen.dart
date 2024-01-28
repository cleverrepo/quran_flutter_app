
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:islamversehub/categories/surah_page.dart';

import '../../categories/audio_page.dart';
import '../../widgets/cardwidgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Image.asset(
                  "Assets/images/kaaba.jpg",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                )),
            Expanded(
                flex: 1,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 160,
                    crossAxisCount: 2,
                  ),
                  children: [
                    Cardwidget(
                      onpress: () {
                        Get.to(()=>const DefaulPage(),transition: Transition.leftToRightWithFade,
                        duration: const Duration(microseconds: 1000));
                      },
                      name: 'Quran',
                      image: "Assets/images/quran.png",
                    ),
                    Cardwidget(
                      onpress: () {},
                      name: 'Dua',
                      image: "Assets/images/dua.png",
                    ),
                    Cardwidget(
                      onpress: () {},
                      name: 'Hadith',
                      image: "Assets/images/moon.png",
                    ),
                    Cardwidget(
                      onpress: () {},
                      name: 'Learn arabic',
                      image: "Assets/images/learn.png",
                    ),
                    Cardwidget(
                      onpress: () {},
                      name: 'Calendar',
                      image: "Assets/images/calendar.png",
                    ),
                    Cardwidget(
                      onpress: () {},
                      name: 'Quiz',
                      image: "Assets/images/quiz.png",
                    ),
                    Cardwidget(
                      onpress: () {
                        Get.to(()=>const Audio(),transition: Transition.circularReveal,
                            duration: const Duration (seconds: 1)

                        );
                      },
                      name: 'list',
                      image: "Assets/images/mp3.png",
                    ),
                    Cardwidget(
                      onpress: () {

                      },
                      name: 'list',
                      image: "Assets/images/time.png",
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
