import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/cubit/app_cubit_states.dart';
import 'package:test_app/cubit/app_cubits.dart';
import 'package:test_app/misc/colors.dart';
import 'package:test_app/model/data_model.dart';
import 'package:test_app/widgets/app_buttons.dart';
import 'package:test_app/widgets/app_large_text.dart';
import 'package:test_app/widgets/app_text.dart';
import 'package:test_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedButtonIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (BuildContext context, state) {
          var info = (state as DetailState).places;
          return SafeArea(
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              child: Stack(
                children: [
                  Positioned(
                      left: 0,
                      right: 0,
                      child: Container(
                        width: double.maxFinite,
                        height: 250,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'http://mark.bslmeiyu.com/uploads/${info.img}'),
                                fit: BoxFit.cover)),
                      )),
                  Positioned(
                      child: Row(
                        children: [
                          IconButton(onPressed: () {
                            BlocProvider.of<AppCubits>(context).goHome();
                          }, icon: const Icon(Icons.menu))
                        ],
                      )),
                  Positioned(
                      top: 200,
                      child: Container(
                        padding:
                        const EdgeInsets.only(top: 35, left: 20, right: 20),
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height - 250,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppLargeText(
                                    text: info.name, color: Colors.black54),
                                AppLargeText(
                                    text: '\$ ${info.price}', color: AppColors.mainColor)
                              ],
                            ),
                            const Padding(padding: EdgeInsets.only(top: 10)),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.mainColor,
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(left: 10)),
                                AppText(
                                  text: info.location,
                                  color: AppColors.textColor1,
                                )
                              ],
                            ),
                            Row(children: [
                              Wrap(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    Icons.star,
                                    color: index < info.stars
                                        ? AppColors.starColor
                                        : AppColors.textColor2,
                                  );
                                }),
                              ),
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              AppText(
                                text: '(${info.stars})',
                                color: AppColors.textColor2,
                              )
                            ]),
                            const Padding(padding: EdgeInsets.only(top: 25)),
                            AppLargeText(
                              text: 'People',
                              color: Colors.black.withOpacity(.8),
                              size: 20,
                            ),
                            const Padding(padding: EdgeInsets.only(top: 5)),
                            AppText(
                              text: 'Number of people in your group',
                              color: AppColors.mainTextColor,
                            ),
                            Wrap(
                              children: List.generate(5, (index) {
                                bool isSelected = selectedButtonIndex == index;

                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedButtonIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 10, top: 10),
                                    child: AppButtons(
                                      size: 50,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                      backgroundColor: isSelected
                                          ? Colors.black87
                                          : AppColors.buttonBackground,
                                      borderColor: isSelected
                                          ? Colors.black87
                                          : AppColors.buttonBackground,
                                      text: (index + 1).toString(),
                                    ),
                                  ),
                                );
                              }),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 10)),
                            const AppLargeText(text: 'Description'),
                            const Padding(padding: EdgeInsets.only(top: 5)),
                            AppText(
                                text: info.description
                            ),
                          ],
                        ),
                      )),
                  Positioned(
                      bottom: 20,
                      right: 20,
                      left: 20,
                      child: Container(
                        // padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppButtons(
                                size: 60,
                                color: AppColors.textColor2,
                                backgroundColor: Colors.white,
                                borderColor: AppColors.textColor2,
                                icon: Icons.favorite_border),
                            const Padding(padding: EdgeInsets.only(left: 40)),
                            const ResponsiveButton(
                              isResponsive: true,
                              text: 'Book Trip Now',
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}