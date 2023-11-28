import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Resources/AppColors/app_colors.dart';
import 'package:weather_app/View/Next14Days/widgets/bottom_list.dart';
import 'package:weather_app/View/Next14Days/widgets/center_card.dart';
import 'package:weather_app/View/Next14Days/widgets/days_list.dart';
import 'package:weather_app/ViewModel/Controllers/days_controller.dart';
import 'package:weather_app/ViewModel/Controllers/home_controller.dart';

import 'widgets/appbar.dart';

class Next14Days extends StatelessWidget {
  final homeController = Get.put(HomeController());
  final controller = Get.put(DaysController());
  Next14Days({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        decoration: AppColors.buildGradientBoxDecoration(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 20),
                      CustomAppbarz(),
                      SizedBox(height: 20),
                      DaysList(),
                    ],
                  ),
                  Positioned(
                    bottom: 1,
                    child: Container(
                      height: size.height / 1.9,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                    ),
                  ),
                  BottomList(),
                  Hero(
                    tag: 'Tag',
                    child: Material(
                      color: Colors.transparent,
                      child: CenterCard(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
