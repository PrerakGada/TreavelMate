import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    List filters = ['Area', 'Price', 'Age', 'Activity'];
    List filtersIcon = [Icons.location_pin, Icons.currency_rupee, Icons.people, Icons.local_activity_outlined];
    List<Map<String, String>> allTours = [
      {"Name": "Resonance", "Area": "Chembur", "Group": "10-12 Members", "Dates": "04/12/2023 - 06/12/2023", "Price": "1000 pp"},
      {"Name": "Choice's Trek", "Area": "Malabar Hills", "Group": "10-12 Members", "Dates": "04/12/2023 - 06/12/2023", "Price": "5000 pp"},
      {"Name": "Adventure Quest", "Area": "Mountains", "Group": "8-10 Members", "Dates": "05/20/2023 - 05/25/2023", "Price": "8000 pp"},
      {"Name": "City Explorer", "Area": "Downtown", "Group": "15-20 Members", "Dates": "07/01/2023 - 07/05/2023", "Price": "1000 pp"},
    ];
    List<Map<String, String>> showTours = List.from(allTours);
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
          child: Column(
            children: [
              SearchBar(
                shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                )),
                leading: const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Icon(
                    Icons.search,
                    // color: Colors.grey,
                  ),
                ),
                hintText: 'Click to search',
                hintStyle: MaterialStateProperty.all(const TextStyle(color: Colors.black)),
                onChanged: (String value) {
                  if (value.isEmpty) {
                    setState(() {
                      showTours = List.from(allTours);
                    });
                  } else {
                    setState(() {
                      showTours.clear();
                      for (var tour in allTours) {
                        if (tour["Name"]!.toLowerCase().contains(value.toLowerCase())) {
                          showTours.add(tour);
                        }
                      }
                    });
                  }
                },
                // backgroundColor: MaterialStateProperty.all(const Color(0xFF302E2E)),
                backgroundColor: MaterialStateProperty.all(Colors.orange[50]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SizedBox(
                  width: w,
                  height: 35,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: filters.length,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                            width: 110,
                            padding: const EdgeInsets.symmetric(horizontal: 22.24),
                            decoration: ShapeDecoration(
                              // color: const Color(0xFF302E2E),
                              color: Colors.green[100],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(27.54),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    filtersIcon[index],
                                    // color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                                Text(
                                  filters[index],
                                  style: const TextStyle(
                                    // color: Colors.white,
                                    fontSize: 12.71,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: showTours.length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Card(
                            // color: const Color(0xFF302E2E),
                            color: Colors.orange[100],
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      "https://picsum.photos/200",
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          showTours[index]["Name"] ?? '',
                                          style: const TextStyle(
                                            // color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.location_pin,
                                              color: Color(0xFF898282),
                                              size: 15,
                                            ),
                                            Text(
                                              showTours[index]["Area"] ?? '',
                                              style: const TextStyle(
                                                color: Color(0xFF898282),
                                                fontSize: 12,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.person_outline,
                                              color: Color(0xFF898282),
                                              size: 15,
                                            ),
                                            Text(
                                              showTours[index]["Group"] ?? '',
                                              style: const TextStyle(
                                                color: Color(0xFF898282),
                                                fontSize: 12,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.calendar_month,
                                              color: Color(0xFF898282),
                                              size: 15,
                                            ),
                                            Text(
                                              showTours[index]["Dates"] ?? '',
                                              style: const TextStyle(
                                                color: Color(0xFF898282),
                                                fontSize: 12,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.currency_rupee,
                                              color: Color(0xFF898282),
                                              size: 15,
                                            ),
                                            Text(
                                              showTours[index]["Price"] ?? '',
                                              style: const TextStyle(
                                                color: Color(0xFF898282),
                                                fontSize: 12,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    // color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
