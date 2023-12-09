import 'dart:math';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tour_mate/utils/palette.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final List<String> images = [
    'assets/images/place1.png',
    'assets/images/place2.png',
    'assets/images/place3.png',
    'assets/images/place1.png',
    'assets/images/place3.png',
  ];

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
                        images[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ]),
                  );
                }),
          ),
          const SizedBox(height: 20),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryChip(
                  text: 'Popular',
                  icon: Icons.location_on_outlined,
                  selected: true,
                ),
                CategoryChip(
                  text: 'Lake',
                  icon: Icons.water_outlined,
                ),
                CategoryChip(
                  text: 'Mountain',
                  icon: Icons.terrain_outlined,
                ),
                CategoryChip(
                  text: 'Resort',
                  icon: Icons.home_work_outlined,
                ),
                CategoryChip(
                  text: 'Beach',
                  icon: Icons.beach_access_outlined,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PlaceCard(
                  place: 'Kashmir',
                  location: 'Jammu and Kashmir',
                  image: 'assets/images/place1.png',
                  rating: 4.5,
                ),
                PlaceCard(
                  place: 'Nusa Pedina',
                  location: 'Bali, Indonesia',
                  image: 'assets/images/place2.png',
                  rating: 4.8,
                ),
                PlaceCard(
                  place: 'Mall Road',
                  location: 'Shimla, Himachal Pradesh',
                  image: 'assets/images/place3.png',
                  rating: 4.1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    super.key,
    required this.place,
    required this.location,
    required this.image,
    required this.rating,
  });

  final String place;
  final String location;
  final String image;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: Colors.black.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 220,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: 220,
                    height: 130,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black.withOpacity(0.3)),
                        shape: MaterialStateProperty.all(const CircleBorder()),
                      ),
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    place,
                    style: TextStyle(
                      fontFamily: GoogleFonts.merriweather().fontFamily,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Palette.secondary,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$rating',
                        style: TextStyle(
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Palette.secondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Palette.secondary.withOpacity(0.7),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    location,
                    style: TextStyle(
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.text,
    required this.icon,
    this.selected = false,
  });

  final String text;
  final IconData icon;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: selected ? Palette.secondary : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: selected ? Palette.secondary : Colors.black.withOpacity(0.1),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: selected ? Colors.white : Colors.black,
          ),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontFamily: GoogleFonts.montserrat().fontFamily,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: selected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
