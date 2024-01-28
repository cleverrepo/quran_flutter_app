import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../variables/constant_variables.dart';

class Cardwidget extends StatelessWidget {
  Cardwidget({
    super.key, required this.name, required this.image, this.onpress,
  });
final  onpress;
final String name;
 final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Card(
        elevation: 20,
        color: maiColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19),
        ),
        child: Stack(
            children:[

              Positioned(
                top: 15,
                  left: 15,
                  child:Image.asset(image,width: 160,height: 150,
                  fit: BoxFit.cover,
                  )
              ),
            ]),
      ),
    );
  }
}
