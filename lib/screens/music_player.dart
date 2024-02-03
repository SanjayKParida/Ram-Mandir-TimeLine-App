import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:ram_mandir_timeline/constants/colors.dart';

import '../constants/audio_library.dart';

class MusicPlayer extends StatefulWidget {
  final Audio audio;
  const MusicPlayer({super.key, required this.audio});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final audioplayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    setAudio();

    // STATE LISTENING
    audioplayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    //CHANGES IN AUDIO DURATION
    audioplayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });

    //LISTENING TO AUDIO POSITION
    audioplayer.onPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  Future setAudio() async {
    //REPEATING SONG WHEN COMPLETED
    audioplayer.setReleaseMode(ReleaseMode.loop);

    //LOADING MUSIC
    final player = AudioCache(prefix: 'assets/audio/');
    final url = await player.load(widget.audio.audioLocation);
    audioplayer.setSourceUrl(
      url.path,
    );
  }

  @override
  void dispose() {
    audioplayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              IconlyLight.arrow_left,
              color: CustomColors.primaryColor,
            )),
      ),
      body: Column(children: [
        Container(
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.1, vertical: size.height * 0.02),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 53, 53, 53),
              borderRadius: BorderRadius.circular(30)),
          height: size.height * 0.45,
          child: Image.asset(
            widget.audio.imageLocation,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //SONG TITLE
              Text(
                widget.audio.title,
                style: GoogleFonts.handlee(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              //SONG AUTHOR
              Text(
                widget.audio.author,
                style: GoogleFonts.handlee(fontSize: 18),
              )
            ],
          ),
        ),

        //PLAYBACK CONTROLS
        Column(
          children: [
            //SONG PLAYER SLIDER
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.1,
              ),
              child: Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  activeColor: CustomColors.primaryColor,
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await audioplayer.seek(position);

                    //IF AUDIO WAS PAUSED
                    await audioplayer.resume();
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(position)),
                  Text(formatTime(duration - position))
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),

            //PLAYBACK CONTROLS
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 53, 53, 53),
                    ),
                    margin: const EdgeInsets.only(left: 20),
                    height: size.height * 0.07,
                    width: size.width * 0.25,
                    child: Center(
                      child: Icon(
                        IconlyBold.arrow_left_2,
                        color: CustomColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.1,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CustomColors.greyBg,
                    ),
                    height: size.height * 0.07,
                    width: size.width * 0.25,
                    child: Center(
                      child: InkWell(
                        onTap: () async {
                          if (isPlaying) {
                            await audioplayer.pause();
                          } else {
                            audioplayer.resume();
                          }
                        },
                        child: isPlaying
                            ? Icon(
                                Icons.pause,
                                color: CustomColors.primaryColor,
                              )
                            : Icon(
                                Icons.play_arrow,
                                color: CustomColors.primaryColor,
                              ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.1,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CustomColors.greyBg,
                    ),
                    height: size.height * 0.07,
                    width: size.width * 0.25,
                    child: Center(
                      child: Icon(
                        IconlyBold.arrow_right_2,
                        color: CustomColors.primaryColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        )
      ]),
    );
  }
}

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes);
  final seconds = twoDigits(duration.inSeconds);

  return [
    if (duration.inHours > 0) hours,
    minutes,
    seconds,
  ].join(":");
}
