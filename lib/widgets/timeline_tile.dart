import 'package:flutter/material.dart';
import 'package:ram_mandir_timeline/constants/colors.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyTimeLineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final child;
  const MyTimeLineTile(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: TimelineTile(
          isFirst: isFirst,
          isLast: isLast,
          beforeLineStyle: LineStyle(
              color: isPast
                  ? CustomColors.primaryColor
                  : CustomColors.secondaryColor),
          indicatorStyle: IndicatorStyle(
              width: 25,
              color: isPast
                  ? CustomColors.primaryColor
                  : CustomColors.secondaryColor),
          endChild: child),
    );
  }
}
