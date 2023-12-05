import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/model/data_model.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_larg_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class DetailePage extends StatefulWidget {
  final DataModel place;
  const DetailePage({super.key, required this.place});

  @override
  State<DetailePage> createState() => _DetailePageState();
}

class _DetailePageState extends State<DetailePage> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    selectedIndex = widget.place.stars;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage('assets/images/${widget.place.img}'))),
                )),
            Positioned(
                left: 20,
                top: 70,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back)),
                  ],
                )),
            Positioned(
                top: 280,
                // top: 70,
                child: Container(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargText(
                              text: '${widget.place.name}',
                              color: Colors.black54,
                            ),
                            AppLargText(
                              text: ' \$${widget.place.price}',
                              color: AppColors.mainTextColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_city,
                              color: AppColors.mainTextColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: '${widget.place.location}',
                              color: AppColors.mainTextColor,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  color: Color.fromARGB(248, 255, 242, 0),
                                );
                              }),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: '(${widget.place.stars}.0)',
                              color: AppColors.mainTextColor,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AppLargText(
                            text: 'People',
                            color: Colors.black.withOpacity(0.8)),
                        SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: 'Number of people in your groub',
                          color: AppColors.mainTextColor,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButtons(
                                    text: (index + 1).toString(),
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    size: 50,
                                    backgroundColor: selectedIndex != index
                                        ? Colors.white
                                        : Colors.black,
                                    borderColor: Colors.black26),
                              ),
                            );
                          }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppLargText(
                          text: 'Description',
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AppText(
                          text: '${widget.place.decoration}',
                          color: Colors.black54,
                        )
                      ],
                    ),
                  ),
                )),
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppButtons(
                        isIcon: true,
                        icon: Icons.favorite_border,
                        color: AppColors.mainTextColor,
                        size: 60,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.mainTextColor),
                    SizedBox(
                      width: 20,
                    ),
                    ResponsiveButton(
                      isResponsive: true,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
