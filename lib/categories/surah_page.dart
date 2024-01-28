import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:islamversehub/categories/favorite.dart';
import 'package:islamversehub/Services/statemanagement.dart';
import 'package:islamversehub/variables/constant_variables.dart';
import 'package:islamversehub/categories/surah.dart';


class DefaulPage extends StatefulWidget {
  const DefaulPage({super.key});

  @override
  State<DefaulPage> createState() => _DefaulPageState();
}

class _DefaulPageState extends State<DefaulPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
            body: Column(children: [
          Align(
            alignment: Alignment.topRight,
            child:
                IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          ),
          const Text("Assalama'alaikum "),

          SizedBox(
            width: 300,
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  hintText: "Search surah",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ),
          const Gap(15),
          Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                  color: maiColor, borderRadius: BorderRadius.circular(15)),
              child: TabBar(
                  unselectedLabelColor: Colors.white,
                  indicator: BoxDecoration(

                      color: shadowColor,
                      borderRadius: BorderRadius.circular(15)),

                  tabs: const [
                    Tab(
                      text: "Surah",
                    ),

                    Tab(
                      text: "Favorite",
                    ),
                  ])),
            const Expanded(child: TabBarView(
              children: [
                QURAN(),

                Favorite(),

              ],
            ))

        ])),
      ),
    );
  }
}




