import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamversehub/Services/apiclass.dart';
import 'package:islamversehub/categories/details_page.dart';

import '../variables/constant_variables.dart';

class QURAN extends StatefulWidget {
  const QURAN({
    super.key,
  });

  @override
  State<QURAN> createState() => _QURANState();
}

class _QURANState extends State<QURAN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<StatusRespond>(
      future: fetchStatusRespond(),
      builder: (BuildContext context, AsyncSnapshot<StatusRespond> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return AlertDialog(
            content: Text(snapshot.error.toString()),
          );
        } else {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: ListView.separated(
              itemCount: snapshot.data!.data.surahs.length,
              itemBuilder: (_, int index) {
                final Surah surah = snapshot.data!.data.surahs[index];

                return InkWell(
                  onTap: () async {
                    final StatusRespond statusRespond =
                        await fetchStatusRespond();
                    final Edition edition = statusRespond.data.edition;

                    Get.to(
                        () => Details(
                              surah: surah,
                              editionName: edition.name,
                              editionIdentifier: edition.identifier,
                              editionLanguage: edition.language,
                              type: edition.name,
                              format: edition.format,
                              name: edition.englishName,
                            ),
                        duration: const Duration(milliseconds: 500),
                        transition: Transition.fadeIn);
                  },
                  child: ListTile(
                    leading: Stack(children: [
                      SvgPicture.asset("Assets/images/nomor-surah.svg"),
                      SizedBox(
                        width: 36,
                        height: 36,
                        child: Center(
                          child: Text(
                            surah.number.toString(),
                            style: GoogleFonts.montserrat(fontSize: 12),
                          ),
                        ),
                      )
                    ]),
                    subtitle: Text("${surah.ayahs.length} - Verse"),
                    trailing: Text(
                      surah.name,
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: maiColor,
                      ),
                    ),
                    title: Text(
                        "${surah.englishName} \n${surah.revelationType.name}"),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(
                thickness: 1,
                color: maiColor,
              ),
            ),
          );
        }
      },
    ));
  }
}
