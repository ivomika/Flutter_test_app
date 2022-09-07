import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/cubit/app_cubit_states.dart';
import 'package:test_app/misc/colors.dart';
import 'package:test_app/widgets/app_large_text.dart';
import 'package:test_app/widgets/app_text.dart';

import '../../cubit/app_cubits.dart';
import '../../widgets/styled/circle_tab_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  var places = {
    'balloning.png': 'balloning',
    'hiking.png': 'hiking',
    'kayaking.png': 'kayaking',
    'snorkling.png': 'snorkling',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state){
          if(state is LoadedState){
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Menu
                SafeArea(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.menu, size: 30, color: Colors.black54),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.withOpacity(.5)),
                        )
                      ],
                    ),
                  ),
                ),
                // Discover
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const AppLargeText(text: 'Discover'),
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                // Tabbar
                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    indicator:
                    CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                    tabs: const [
                      Tab(text: 'Places'),
                      Tab(text: 'Inspiration'),
                      Tab(text: 'Emotions')
                    ],
                  ),
                ),
                SizedBox(
                  height: 250,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                          padding: const EdgeInsets.only(left: 20),
                          itemCount: info.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 10, right: 15),
                                width: 175,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: NetworkImage('http://mark.bslmeiyu.com/uploads/${info[index].img}'),
                                        fit: BoxFit.cover)),
                              ),
                            );
                          }),
                      const Text('There'),
                      const Text('Nocing'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AppLargeText(text: 'Explore more', size: 22),
                      AppText(text: 'See all', color: AppColors.textColor1)
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(top: 20, left: 20),
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 50),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage('assets/img/${places.keys.elementAt(index)}'),
                                        fit: BoxFit.cover)),
                              ),
                              const Padding(padding: EdgeInsets.only(top: 10)),
                              AppText(
                                text: places.values.elementAt(index),
                                color: AppColors.textColor2,
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],
            );
          }
          else{
            return Container();
          }
        }
      )
    );
  }
}
