import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ram_mandir_timeline/constants/colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          //RAM MANDIR BANNER
          Stack(
            children: [
              Container(
                  clipBehavior: Clip.antiAlias,
                  height: size.height * 0.4,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35))),
                  child: Opacity(
                    opacity: 0.45,
                    child: Image.asset(
                      'assets/images/ram_mandir.jpg',
                      fit: BoxFit.cover,
                    ),
                  )),
              Positioned(
                bottom: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Ram Mandir",
                    style: GoogleFonts.patrickHand(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.whitePrimary),
                  ),
                ),
              ),
            ],
          ),

          //ABOUT TEXT
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  'About',
                  style: GoogleFonts.patrickHand(
                      color: CustomColors.primaryColor, fontSize: 28),
                ),
              ],
            ),
          ),

          //ABOUT DESCRIPTION
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'The Ram Mandir in Ayodhya is found in the city of Ayodhya, Uttar Pradesh, India. It’s located at the Ram Janmabhoomi, believed to be where Lord Rama was born. If you’re planning to visit, you can get the exact location details from local authorities or use navigation services. The temple is near the river Sarayu, adding to the scenic surroundings.\n\nThe expected completion date for the Ayodhya Ram Mandir is February 24, 2024. Once the opening date is officially announced, the booking process for darshan (viewing) of the temple in 2024 will begin. To secure your tickets, you will need to register for the Ayodhya Ram Mandir in 2024. This registration is necessary to ensure you can have a glimpse of the newly constructed Ram Mandir.\n\nThe highly anticipated Hindu temple at Ram Janm Bhumi is currently being built, and Hindus worldwide are eagerly awaiting its opening. It is reported that the inauguration will take place on January 24, 2024, with Prime Minister Modi doing the honors for this modern temple in India. Ayodhya, where the temple is located, is believed to be the birthplace of Shri Ram, making it a very sacred place in India.',
              style: GoogleFonts.handlee(fontSize: 17, color: Colors.grey[200]),
            ),
          ),
          SizedBox(
            height: size.height * 0.023,
          ),

          //FOOTER SECTION
          Text(
            'version 0.0.1 | Sanjay K. Parida',
            style: GoogleFonts.patrickHand(color: Colors.grey),
          ),
          SizedBox(
            height: size.height * 0.023,
          ),
        ],
      ),
    );
  }
}
