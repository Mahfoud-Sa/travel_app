import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_larg_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    'welcome-one.png',
    'welcome-two.png',
    'welcome-three.png',
  ];
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage("assets/images/${images[index]}"))),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargText(text: "Trips"),
                        AppText(
                          text: "Discover",
                          size: 30,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: 250,
                            child: AppText(
                                size: 14,
                                text:
                                    "Mountain hike to be Mountain hike to be Mountain hike to be Mountain hike to be another the yink to allowed the hero tradional security")),
                        SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (index == 2) {
                              BlocProvider.of<AppCubits>(context).getData();
                            } else {
                              _pageController.nextPage(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeIn);
                            }
                          },
                          child: Container(
                            width: 200,
                            child: Row(
                              children: [
                                ResponsiveButton(
                                  width: 120,
                                  isResponsive: false,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDotes) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDotes ? 25 : 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDotes
                                  ? AppColors.mainTextColor
                                  : AppColors.mainTextColor.withOpacity(0.3)),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
