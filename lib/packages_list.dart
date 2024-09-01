import 'package:flutter/material.dart';
import 'package:nannyvanny/api_calls/api_services.dart';
import 'package:nannyvanny/theme/custom_theme.dart';

class PackagesList extends StatefulWidget {
  const PackagesList({super.key});

  @override
  State<PackagesList> createState() => _PackagesListState();
}

class _PackagesListState extends State<PackagesList> {
  Future<List<Map<String, dynamic>>> fetchPackagesList() async {
    final response = await ApiServices().getData("packages_list");
    List<dynamic> data = response['data']['response'];
    return data.map((item) => item as Map<String, dynamic>).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0,vertical: 0),
        child: FutureBuilder<List<Map<String, dynamic>>>(
            future: fetchPackagesList(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator()); // Loading state
              } else if (snapshot.hasError) {
                return Center(
                    child: Text("Error: ${snapshot.error}")); // Error state
              } else if (!snapshot.hasData || snapshot.data == null) {
                return const Center(
                    child: Text("No Packages Available")); // Empty data state
              } else {
                return ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final package = snapshot.data![index];
                      if (index % 2 == 0) {
                        
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                              color: CustomTheme.primaryContainer,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        "assets/images/one.png",
                                        width: 30,
                                        height: 30,
                                        fit: BoxFit.cover,
                                      ),
                                      Container(
                                        height: 25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(11),
                                          color: CustomTheme.primary,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: Center(
                                            child: Text(
                                              "Book Now",
                                              style: TextStyle(
                                                  color: Color(0xFFFFFFFF)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${package['title']}',
                                          style: const TextStyle(
                                              color: CustomTheme.secondary,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          "₹ ${package['price']}",
                                          style: const TextStyle(
                                              color: CustomTheme.secondary,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "${package['desc']}",
                                    style: const TextStyle(
                                        color: CustomTheme.primaryText,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Container(
                            height: 140,
                            decoration: BoxDecoration(
                              color: CustomTheme.secondaryContainer,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        "assets/images/three.png",
                                        width: 30,
                                        height: 30,
                                        fit: BoxFit.cover,
                                      ),
                                      Container(
                                        height: 25,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(11),
                                          color: CustomTheme.tertiary,
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: Center(
                                            child: Text(
                                              "Book Now",
                                              style: TextStyle(
                                                  color: Color(0xFFFFFFFF)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${package['title']}",
                                          style: const TextStyle(
                                              color: CustomTheme.secondary,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 16),
                                        ),
                                        Text(
                                          "₹ ${package['price']}",
                                          style: const TextStyle(
                                              color: CustomTheme.secondary,
                                              fontWeight: FontWeight.w900,
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "${package['desc']}",
                                    style: const TextStyle(
                                        color: CustomTheme.primaryText,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    });
              }
            }));
  }
}
