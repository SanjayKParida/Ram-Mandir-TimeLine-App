import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ram_mandir_timeline/constants/colors.dart';

class InfoCard extends StatelessWidget {
  final String child;
  const InfoCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CustomColors.darkSaffron,
          borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(25),
      padding: const EdgeInsets.all(25),
      child: Text(
        child,
        style: GoogleFonts.handlee(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 10,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
