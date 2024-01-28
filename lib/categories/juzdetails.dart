// import 'package:audioplayers/audioplayers.dart';
// import 'package:clipboard/clipboard.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:islamversehub/Services/statemanagement.dart';
// import 'package:share/share.dart';
// import '../variables/constant_variables.dart';
//
// class JuzDetails extends StatefulWidget {
//   const JuzDetails({
//     super.key,
//     required this.editionName,
//     required this.editionIdentifier,
//     required this.editionLanguage,
//     required this.type,
//     required this.format,
//     required this.name,
//     required this.surahs,
//   });
//   final Surahs surahs;
//
//   final String editionName;
//   final String editionIdentifier;
//   final String editionLanguage;
//   final String type;
//   final String format;
//   final String name;
//
//   @override
//   State<JuzDetails> createState() => _JuzDetailsState();
// }
//
// class _JuzDetailsState extends State<JuzDetails> {
//   AudioPlayer audioPlayer = AudioPlayer();
//
//   Duration duration = const Duration();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: const Icon(Icons.arrow_back_ios),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               width: 370,
//               height: 65,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(
//                     color: shadowColor,
//                     blurRadius: 6,
//                     offset: const Offset(3, 3),
//                   ),
//                   const BoxShadow(
//                     color: Colors.white,
//                     blurRadius: 6,
//                     offset: Offset(-3, -3),
//                   )
//                 ],
//               ),
//               child: Stack(
//                 children: [
//                   Image.asset(
//                     "Assets/images/kaba.png",
//                     width: double.infinity,
//                     height: 220,
//                     fit: BoxFit.cover,
//                   ),
//                   Positioned(
//                     top: 0,
//                     left: 90,
//                     child: Positioned(
//                       left: 35,
//                       top: 30,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Text(
//                             widget.surahs.englishName,
//                             style: GoogleFonts.montserrat(
//                               color: Colors.white,
//                               fontSize: 14,
//                             ),
//                           ),
//                           Text(
//                             widget.surahs.englishNameTranslation,
//                             style: GoogleFonts.montserrat(
//                               color: Colors.white,
//                               fontSize: 14,
//                             ),
//                           ),
//                           Text(
//                            " widget.surahs.l,",
//                             style: GoogleFonts.montserrat(
//                               color: Colors.white,
//                               fontSize: 14,
//                             ),
//                           ),
//                           Text(
//                             widget.surahs.revelationType,
//                             style: GoogleFonts.montserrat(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 2,
//             child: Column(
//               children: [
//                 Container(
//                   margin: const EdgeInsets.only(top: 20),
//                   width: 320,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: maiColor,
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Center(
//                       child: Text(
//                     widget.surahs.name,
//                     style: GoogleFonts.montserrat(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   )),
//                 ),
//                 const Gap(10),
//                 Expanded(
//                     child: ListView.separated(
//                   itemCount: widget.surahs.ayahs.length,
//                   itemBuilder: (_, int index) {
//                     final Ayahs? ayah = widget.surahs.ayahs[index];
//
//                     return Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: ListTile(
//                         leading: Stack(
//                           children: [
//                             SvgPicture.asset("Assets/images/nomor-surah.svg"),
//                             SizedBox(
//                               width: 36,
//                               height: 36,
//                               child: Center(
//                                 child: Text(
//                                   ayah!.numberInSurah.toString(),
//                                   style: GoogleFonts.montserrat(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         subtitle: Text("Page ${ayah.page}"),
//
//                         trailing: Text(ayah.hizbQuarter.toString()),
//                         // Use the text from MyAyahs
//                         title: Text(
//                           ayah.text, // Display ayah text as the title
//                           style: GoogleFonts.montserrat(
//                               fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     );
//                   },
//                   separatorBuilder: (BuildContext context, int index) {
//                     final Ayahs ayah = widget.surahs.ayah[index];
//                     return Container(
//                       margin: const EdgeInsets.only(left: 15, right: 15),
//                       width: 70,
//                       height: 35,
//                       decoration: BoxDecoration(
//                           color: shadowColor,
//                           borderRadius: BorderRadius.circular(20)),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           IconButton(
//                               onPressed: () {
//                                 Share.share(
//                                   ayah.text,
//                                   subject: "Share Ayah",
//                                 );
//                               },
//                               icon: const Icon(Icons.share)),
//                           IconButton(
//                               onPressed: () {
//                                 FlutterClipboard.copy(ayah.text)
//                                     .then((value) => Get.snackbar(
//                                           'Copy Success',
//                                           'Ayah copied to clipboard',
//                                           snackPosition: SnackPosition.BOTTOM,
//                                           duration: const Duration(seconds: 2),
//                                           backgroundColor: Colors.white10,
//                                           colorText: maiColor,
//                                         ));
//                               },
//                               icon: const Icon(Icons.copy)),
//                           IconButton(
//                               onPressed: () {}, icon: const Icon(Icons.pause)),
//                           IconButton(
//                               onPressed: () {},
//                               icon: const Icon(Icons.play_arrow_outlined)),
//                         ],
//                       ),
//                     );
//                   },
//                 ))
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
