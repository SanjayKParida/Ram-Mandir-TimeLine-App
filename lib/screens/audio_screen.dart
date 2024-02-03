import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ram_mandir_timeline/constants/audio_library.dart';
import 'package:ram_mandir_timeline/screens/music_player.dart';
import 'package:ram_mandir_timeline/widgets/audio_card.dart';

import '../constants/colors.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Bhajan',
          style: GoogleFonts.patrickHand(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: CustomColors.primaryColor),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  'Available songs',
                  style: TextStyle(
                      color: CustomColors.whiteSecondary, fontSize: 25),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                for (int i = 0; i < audioLibrary.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  MusicPlayer(audio: audioLibrary[i])))),
                      child: AudioCard(
                          img: audioLibrary[i].imageLocation,
                          title: audioLibrary[i].title,
                          author: audioLibrary[i].author),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
