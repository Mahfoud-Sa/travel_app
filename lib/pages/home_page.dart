import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_state.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/pages/detailes_page.dart';
import 'package:travel_app/widgets/app_larg_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    List<String> sports = [
      'kayiking.jpg',
      'ballowing.jpg',
      'hiking.jpg',
      'swimming.jpg',
      'tennis.jpg',
    ];
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitState>(
        builder: (context, state) {
          if (state is LoadedState) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //menu text
                  Container(
                    padding: const EdgeInsets.only(top: 40, left: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu,
                          size: 30,
                          color: Colors.black,
                        ),
                        Expanded(child: Container()),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(0.5)),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //Title
                  Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: AppLargText(text: 'Discover')),
                  SizedBox(
                    height: 10,
                  )
                  //tabbar
                  ,
                  Container(
                    child: Align(
                      // alignment: Alignment.centerLeft,
                      child: TabBar(
                        //labelPadding: const EdgeInsets.only(left: 20, right: 20),
                        //isScrollable: true,
                        controller: _tabController,
                        labelColor: Colors.black,
                        tabs: [
                          Tab(
                            text: "Places",
                          ),
                          Tab(
                            text: "Inspiration",
                          ),
                          Tab(
                            text: "Emotions",
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 20),
                    height: 300,
                    width: double.maxFinite,
                    child: TabBarView(controller: _tabController, children: [
                      ListView.builder(
                        itemCount: state.places.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailePage(
                                          place: state.places[index])));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 10, right: 15),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/${state.places[index].img}'))),
                            ),
                          );
                        },
                      ),
                      Text("There"),
                      Text("Bye"),
                    ]),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //Explorer More
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargText(
                          text: 'Explorer More',
                          size: 22,
                        ),
                        Expanded(child: Container()),
                        AppText(
                          text: 'See All',
                          color: AppColors.mainTextColor,
                        )
                      ],
                    ),
                  ),

                  Container(
                    height: 130,
                    width: double.maxFinite,
                    //margin: const EdgeInsets.only(left: 20),
                    child: ListView.builder(
                        padding: const EdgeInsets.only(left: 15),
                        scrollDirection: Axis.horizontal,
                        itemCount: sports.length,
                        itemBuilder: (BuildContext contexet, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/${sports[index]}'))),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: AppText(
                                    text: '${sports[index]}'
                                        .substring(0, sports[index].length - 4),
                                    size: 14,
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class CircleTabIndicator extends DecoratedBox {
  final Color color;
  double radius;
  CircleTabIndicator(
      {required this.color, required this.radius, required super.decoration});
  //CircularTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    canvas.drawCircle(offset, radius, _paint);
  }
}
