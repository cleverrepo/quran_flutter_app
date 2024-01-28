import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:islamversehub/categories/audio_screen.dart';
import 'package:islamversehub/variables/constant_variables.dart';

import '../Services/reciters_api.dart';

class Audio extends StatefulWidget {
  const Audio({super.key});

  @override
  State<Audio> createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<ReciterAudio>(
      future: ReciterAudio.fetchReciterAudio(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return AlertDialog(content: Text(snapshot.error.toString()));
        } else {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (_, int index) {
                      final Reciters reciters = snapshot.data!.reciters![index];
                      List<Moshaf> moshafList = reciters.moshaf ?? [];

                      return GestureDetector(
                        onTap: (){
                          Get.to(()=>const AudioScreen(),
                          transition: Transition.circularReveal,
                            duration: const Duration(seconds: 1)
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              leading: CircleAvatar(child: Text(reciters.letter.toString())),
                              title: Text(reciters.name.toString()),
                            )
                            ]
                        ),
                      );
                    },
                    separatorBuilder: (_, int index) => Divider(
                      color: maiColor,
                      thickness: 2,
                    ),
                    itemCount: snapshot.data!.reciters!.length,
                  ),
                ),
              ],
            ),
          );
        }
      },
    ));
  }
}
// if (moshafList.isNotEmpty)
//       subtitle: Text("${moshaf.surahTotal ?? 0}"),

//),

//   Padding(
//     padding: const EdgeInsets.only(left: 16.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: moshafList.map((moshaf) {
//         return ListTile(
//           leading: Text('Moshaf ID: ${moshaf.id}'),
//           title: Text(moshaf.name ?? ''),
//           subtitle: Text('Surah Total: ${moshaf.surahTotal ?? 0}'),
//         );
//       }).toList(),
//     ),
// ),