import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/cubit/app_cubits.dart';
import 'package:test_app/widgets/app_large_text.dart';
import 'package:test_app/widgets/app_text.dart';
import 'package:test_app/widgets/responsive_button.dart';

import '../misc/colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png"
  ];

  List<String> text = [
    'What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
    'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/img/${images[index]}'
                  )
                )
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppLargeText(text: 'Trips'),
                        const AppText(
                          text: 'Mountain',
                          size: 30,
                          color: Colors.black,
                        ),
                        const Padding(
                            padding: EdgeInsets.only(top: 20)
                        ),
                        SizedBox(
                          width: 250,
                          child: AppText(
                            text: text[index],
                            color: AppColors.textColor2,
                            size: 14,
                          ),
                        ),
                        const Padding(
                            padding: EdgeInsets.only(top: 40)
                        ),
                        if(images.last == images[index])
                          GestureDetector(
                            onTap: (){
                              BlocProvider.of<AppCubits>(context).getData();
                            },
                            child: Container(
                              width: 120,
                              child: Row(
                                children: const [ResponsiveButton(width: 120,)]
                              ),
                            ),
                          )
                      ],
                    ),
                    Column(
                      children:
                        List.generate(3, (indexDots) {
                          final isCurrentPage = index == indexDots;
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: isCurrentPage ? 25 : 8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: isCurrentPage ?
                                AppColors.mainColor :
                                AppColors.mainColor.withOpacity(0.3)
                            ),
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
