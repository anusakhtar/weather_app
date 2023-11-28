import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Resources/Images/image_assets.dart';
import 'package:weather_app/Utilties/utilties.dart';
import 'package:weather_app/View/Next14Days/widgets/smallContainer_list.dart';
import 'package:weather_app/ViewModel/Controllers/days_controller.dart';
import 'package:weather_app/ViewModel/Controllers/home_controller.dart';

class CenterCard extends StatelessWidget {
  final homeController = Get.put(HomeController());
  final controller = Get.put(DaysController());
  CenterCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 440,
      margin: EdgeInsets.only(top: 80),
      child: Stack(
        children: [
          Positioned(
            bottom: 50,
            left: 30,
            right: 30,
            child: Container(
              width: size.width,
              height: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.blue.withOpacity(.7),
                        Colors.blue.withOpacity(.5),
                        Colors.blue.withOpacity(.7),
                      ])),
              child: Stack(alignment: Alignment.topRight, children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(.5)
                              ]).createShader(bounds);
                        },
                        child: Obx(
                          () => Text(
                            '${controller.day.value.temp.toInt().toString()}\u00B0',
                            style: TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.bold,
                              height: 0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Obx(() => Text(
                            'Feel Like ${controller.day.value.feelslike}',
                            style: TextStyle(
                              height: 0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Obx(
                          () => Text(
                            controller.day.value.conditions,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 0,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          Utilties.currentTime(),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(.8),
                            height: 0,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(.5),
                          ]).createShader(bounds);
                    },
                    child: Image.asset(
                      ImageAssets.windWave,
                      width: 200,
                      height: 130,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  child: SizedBox(
                    width: size.width - 60,
                    child: SmallContainerList(),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 2,
                  child: Obx(
                    () => Image.asset(
                      controller.getImage(controller.currentDay.value),
                      height: 160,
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
