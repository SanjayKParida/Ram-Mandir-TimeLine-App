import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ram_mandir_timeline/constants/colors.dart';
import 'package:ram_mandir_timeline/constants/mandir_info.dart';
import 'package:ram_mandir_timeline/screens/more_info.dart';
import 'package:ram_mandir_timeline/widgets/info_card.dart';
import 'package:ram_mandir_timeline/widgets/timeline_tile.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Timeline',
          style: GoogleFonts.patrickHand(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: CustomColors.primaryColor),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: ListView(
            children: [
              for (int i = 0; i < mandirInformation.length; i++)
                MyTimeLineTile(
                  isFirst: mandirInformation[i].isFirst,
                  isLast: mandirInformation[i].isLast,
                  isPast: mandirInformation[i].isPast,
                  child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MoreInfo(mandirInfo: mandirInformation[i]))),
                      child: InfoCard(child: mandirInformation[i].child)),
                )
            ],
          )),
    );
  }
}
