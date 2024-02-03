import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:ram_mandir_timeline/constants/mandir_info.dart';

import '../constants/colors.dart';

class MoreInfo extends StatelessWidget {
  final MandirInfo mandirInfo;
  const MoreInfo({super.key, required this.mandirInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Information',
          style: GoogleFonts.patrickHand(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: CustomColors.primaryColor),
        ),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              IconlyLight.arrow_left,
              color: CustomColors.primaryColor,
            )),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 53, 53, 53)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            mandirInfo.child,
            style: GoogleFonts.handlee(fontSize: 20, color: Colors.grey[200]),
          ),
        ),
      ),
    );
  }
}
