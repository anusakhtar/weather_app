import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Resources/Images/image_assets.dart';
import 'package:weather_app/View/HomeScreen/widgets/small_container.dart';
import 'package:weather_app/ViewModel/Controllers/days_controller.dart';
import 'package:weather_app/ViewModel/Controllers/home_controller.dart';

class SmallContainerList extends StatelessWidget {
  final homeController =Get.put(HomeController());
  final controller=Get.put(DaysController());
  SmallContainerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Obx(() => SmallContainer(text: '${controller.day.value.precipprob.toInt().toString()}%', image: ImageAssets.heavyRain, textColor: Colors.white, color: Colors.white38)),
        Spacer(),
        Obx(() => SmallContainer(text: '${controller.day.value.windspeed.toInt().toString()}km/hr', image: ImageAssets.wind, textColor: Colors.white, color: Colors.white38)),
        Spacer(),
        Obx(() => SmallContainer(text: '${controller.day.value.humidity.toInt().toString()}%', image: ImageAssets.sun, textColor: Colors.white, color: Colors.white38)),
      Spacer(),
      ],
    );
  }
}
