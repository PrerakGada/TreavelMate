import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_mate/utils/palette.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset('assets/svgs/menu.svg'),
        ),
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/svgs/location_spot.svg',
              height: 40,
            ),
            const Text('IIT Bombay, Mumbai'),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              'assets/images/avatar.png',
              height: 80,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi Vividha,",
                    style: TextStyle(
                      fontFamily: GoogleFonts.merriweather().fontFamily,
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "Where do you \nwanna go?",
                    style: TextStyle(
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          SizedBox(
            // height: 400,
            height: min(w / 3.3 * (16 / 9), h * .9),
            child: Swiper(
                itemCount: 5,
                autoplay: true,
                viewportFraction: 0.8,
                scale: 0.9,
                layout: SwiperLayout.STACK,
                itemWidth: w - 40,
                itemHeight: min(w / 3.3 * (16 / 9), h * .9) - 32,
                scrollDirection: Axis.vertical,
                fade: 100,
                pagination: SwiperCustomPagination(
                  builder: (context, config) {
                    return Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        // margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            config.itemCount,
                            (index) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: config.activeIndex == index ? Palette.secondary : Colors.transparent,
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                ),
                                child: Container(
                                  margin: const EdgeInsets.all(2),
                                  width: config.activeIndex == index ? 12 : 10,
                                  height: config.activeIndex == index ? 12 : 10,
                                  decoration: BoxDecoration(
                                    color: config.activeIndex == index ? Palette.secondary : Colors.black26,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Stack(children: [
                      Image.asset(
                        'assets/images/destination.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ]),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
