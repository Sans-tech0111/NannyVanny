import 'package:flutter/material.dart';
import 'package:nannyvanny/api_calls/api_services.dart';
import 'package:nannyvanny/packages_list.dart';
import 'package:nannyvanny/theme/custom_theme.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;

  double yOffset = 0;

  double scaleFactor = 1;

  BoxShadow shadow =
      const BoxShadow(color: CustomTheme.alternate, blurRadius: 0);

  BorderRadius radius = BorderRadius.circular(0);

  Future<List<Map<String, dynamic>>> fetchCurrentBookings() async {
    final response = await ApiServices().getData("current_booking_list");
    List<dynamic> data = response['data']['response'];
    return data.map((item) => item as Map<String, dynamic>).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () {
          setState(() {
            xOffset = 0;
            yOffset = 0;
            scaleFactor = 1;
            shadow =
                const BoxShadow(color: CustomTheme.alternate, blurRadius: 0);
            radius = BorderRadius.circular(0);
          });
        },
        child: AnimatedContainer(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              boxShadow: [shadow],
              borderRadius: radius),
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor),
          duration: const Duration(milliseconds: 250),
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(right: 15, top: 30),
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  xOffset = 280;
                                  yOffset = 90;
                                  scaleFactor = 0.8;
                                  shadow = const BoxShadow(
                                      color: CustomTheme.alternate, blurRadius: 20);
                                  radius = BorderRadius.circular(20);
                                });
                              },
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 2,
                                        color: CustomTheme.primary,
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Container(
                                        width: 15,
                                        height: 2,
                                        color: CustomTheme.primary,
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Container(
                                        width: 20,
                                        height: 2,
                                        color: CustomTheme.primary,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                      child: Row(
                        children: [
                          Container(
                            width: 53,
                            height: 53,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: CustomTheme.primary)),
                            child: Image.asset(
                              "assets/images/avatar.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Welcome",
                                  style: TextStyle(
                                      color: CustomTheme.primaryText,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900),
                                ),
                                Text(
                                  "Emily Cyrus",
                                  style: TextStyle(
                                      color: CustomTheme.primary,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 36),
                          child: Container(
                            alignment: AlignmentDirectional.centerStart,
                            height: 170,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: CustomTheme.primaryContainer,
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Container(
                                width: 180,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Nanny And Babysitting Services",
                                      style: TextStyle(
                                          color: CustomTheme.secondary,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          height: 1.25),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                        height: 25,
                                        child: FilledButton(
                                          onPressed: () {},
                                          style: FilledButton.styleFrom(
                                              backgroundColor:
                                                  CustomTheme.secondary),
                                          child: const Text("Book Now"),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60, bottom: 10),
                          child: Image.asset(
                            "assets/images/nannyvanny.png",
                            width: double.infinity,
                            height: 220,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        "Your Current Booking",
                        style: TextStyle(
                            color: CustomTheme.secondary,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                      child: Container(
                        width: double.infinity,
                        height: 180,
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              const BoxShadow(
                                  color: CustomTheme.alternate, blurRadius: 3)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: FutureBuilder<List<Map<String, dynamic>>>(
                              future: fetchCurrentBookings(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child:
                                          CircularProgressIndicator()); // Loading state
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text(
                                          "Error: ${snapshot.error}")); // Error state
                                } else if (!snapshot.hasData ||
                                    snapshot.data == null) {
                                  return const Center(
                                      child: Text(
                                          "No Packages Available")); // Empty data state
                                } else {
                                  final bookings = snapshot.data![0];
                                  return Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${bookings['title']}",
                                            style: const TextStyle(
                                                color: CustomTheme.primary,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          SizedBox(
                                              height: 22,
                                              width: 80,
                                              child: FilledButton(
                                                onPressed: () {},
                                                style: FilledButton.styleFrom(
                                                    backgroundColor:
                                                        CustomTheme.primary),
                                                child: const Text("Start"),
                                              ))
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "From",
                                                    style: TextStyle(
                                                        color:
                                                            CustomTheme.secondary),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons
                                                            .calendar_month_outlined,
                                                        size: 16,
                                                        color: CustomTheme.primary,
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        "${bookings['from_date']}",
                                                        style: const TextStyle(
                                                            color: CustomTheme
                                                                .primaryText,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.access_time,
                                                        size: 16,
                                                        color: CustomTheme.primary,
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        "${bookings['from_time']}",
                                                        style: const TextStyle(
                                                            color: CustomTheme
                                                                .primaryText,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "To",
                                                    style: TextStyle(
                                                        color:
                                                            CustomTheme.secondary),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons
                                                            .calendar_month_outlined,
                                                        size: 16,
                                                        color: CustomTheme.primary,
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        "${bookings['to_date']}",
                                                        style: const TextStyle(
                                                            color: CustomTheme
                                                                .primaryText,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.access_time,
                                                        size: 16,
                                                        color: CustomTheme.primary,
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        "${bookings['to_time']}",
                                                        style: const TextStyle(
                                                            color: CustomTheme
                                                                .primaryText,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 22,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              color: CustomTheme.secondary,
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.0),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.star_outline,
                                                        size: 16,
                                                        color: Color(0xFFFFFFFF)),
                                                    Text(
                                                      "Rate Us",
                                                      style: TextStyle(
                                                          color: Color(0xFFFFFFFF)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 22,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              color: CustomTheme.secondary,
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.0),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.location_on_outlined,
                                                        size: 16,
                                                        color: Color(0xFFFFFFFF)),
                                                    Text(
                                                      "Geolocation",
                                                      style: TextStyle(
                                                          color: Color(0xFFFFFFFF)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 22,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                              color: CustomTheme.secondary,
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.0),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.mic_none,
                                                        size: 16,
                                                        color: Color(0xFFFFFFFF)),
                                                    Text(
                                                      "Survillence",
                                                      style: TextStyle(
                                                          color: Color(0xFFFFFFFF)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }
                              }),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 36),
                      child: Text(
                        "Packages",
                        style: TextStyle(
                            color: CustomTheme.secondary,
                            fontSize: 20,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    const PackagesList(),
                    const SizedBox(height: 70,)
                  ],
                ),
              ),
              Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                boxShadow: [BoxShadow(color: Color.fromARGB(21, 0, 0, 0),blurRadius: 10,spreadRadius:1)]
              ),
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/home.png",height: 25,width: 25,fit: BoxFit.cover,),
                      const Padding(
                        padding: EdgeInsets.only(top:1),
                        child: Text("Home",style: TextStyle(color: CustomTheme.primary),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:1),
                        child: Container(
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                          color: CustomTheme.primary,
                          shape: BoxShape.circle,
                        
                        ),),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/sale.png",height: 25,width: 25,fit: BoxFit.cover,),
                      const Padding(
                        padding: EdgeInsets.only(top:1),
                        child: Text("Packages",style: TextStyle(color: CustomTheme.primaryText),),
                      ),
                      
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/booking.png",height: 25,width: 25,fit: BoxFit.cover,),
                      const Padding(
                        padding: EdgeInsets.only(top:1),
                        child: Text("Booking",style: TextStyle(color: CustomTheme.primaryText),),
                      ),
                      
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/user.png",height: 25,width: 25,fit: BoxFit.cover,),
                      const Padding(
                        padding: EdgeInsets.only(top:1),
                        child: Text("Profile",style: TextStyle(color: CustomTheme.primaryText),),
                      ),
                      
                    ],
                  ),
                  
                ],
              ),
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
