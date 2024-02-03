import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AudioCard extends StatelessWidget {
  final String img;
  final String title;
  final String author;
  const AudioCard(
      {super.key,
      required this.img,
      required this.title,
      required this.author});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 53, 53, 53),
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      height: size.height * 0.13,
      child: Row(children: [
        Container(
          margin: const EdgeInsets.all(10),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Image.asset(img),
        ),
        SizedBox(
          width: size.width * 0.04,
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(top: 15.0, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                author,
                style:
                    TextStyle(color: CustomColors.whiteSecondary, fontSize: 16),
              )
            ],
          ),
        ))
      ]),
    );
  }
}
