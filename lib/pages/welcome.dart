import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubit/app_cubits.dart';
import 'package:my_app/misc/colors.dart';
import 'package:my_app/widgets/App_text.dart';
import 'package:my_app/widgets/app_large_text.dart';
import 'package:my_app/widgets/responsive_button.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "img/"+images[index]
                ),
                fit: BoxFit.cover
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
                      const AppLargeText(text: "Trips"),
                      const AppText(text: "Mountains", size: 30),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        width: 250,
                        child: AppText(
                          text: "Mountain hikes gives you an incredible sense of freedom along with endurance",
                          color: AppColors.textColor2,
                          size: 14
                        )
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context).getData();
                        },
                        child: Container(
                          width: 200,
                            child: Row(
                              children: [
                                ResponsiveButton(width: 120),
                              ],
                            )
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexDots) => Container(
                      margin: const EdgeInsets.only(bottom: 2),
                      width: 8,
                      height: index == indexDots ? 25 : 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index == indexDots ? AppColors.mainColor : AppColors.mainColor.withOpacity(.3)
                      ),
                    )),
                  )
                ],
              ),
            ),
          );
      }),
    );
  }
}
