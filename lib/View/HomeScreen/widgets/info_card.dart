import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Resources/Images/image_assets.dart';
import 'package:weather_app/Utilties/utilties.dart';
import 'package:weather_app/ViewModel/Controllers/home_controller.dart';

class InfoCard extends StatelessWidget {
  InfoCard({super.key});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: 233,
      width: size.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 180,
            width: size.width,
            margin: EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue.withOpacity(.3),
                      Colors.blue.withOpacity(.4),
                      Colors.blue.withOpacity(.3),
                    ],),),
          ),
          Positioned(
              top: 0,
              left: 2,
              child: Obx(() {
                return Image.asset(
                  controller.getImage(controller.currentIndex.value),
                  height: 140,
                  width: 140,
                  fit: BoxFit.fill,
                );
              })),
          Positioned(
            bottom: 50,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  return Text(
                    controller.getCondition(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
                SizedBox(height: 5),
                Text(
                  Utilties.currentTime(),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(.8),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 30,
            right: 30,
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
                          Colors.white.withOpacity(.1),
                        ]).createShader(bounds);
                  },
                  child: Obx(
                    () => Text(
                      controller.getCurrentTemp(),
                      style: TextStyle(
                        height: 0,
                        fontSize: 60,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Text(
                    "feel like ${controller.getFeelLike()}",
                    style: TextStyle(
                      height: 0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 0,
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(.1),
                    ]).createShader(bounds);
              },
              child: Image.asset(
                ImageAssets.windWave,
                height: 100,
                width: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
