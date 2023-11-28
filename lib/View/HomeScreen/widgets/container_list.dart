import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Resources/Images/image_assets.dart';
import 'package:weather_app/View/HomeScreen/widgets/small_container.dart';
import 'package:weather_app/ViewModel/Controllers/home_controller.dart';

class ContainerList extends StatelessWidget {
  ContainerList({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() =>SmallContainer(text: '${controller.getCloudCover()}%', image: ImageAssets.heavyRain, textColor: Colors.white, color: Colors.black54,) ),
          Obx(() =>SmallContainer(text: '${controller.getWindSpeed()}km/h', image: ImageAssets.wind, textColor: Colors.white, color: Colors.black54,) ),
          Obx(() =>SmallContainer(text: '${controller.getHumidity()}%', image: ImageAssets.sun, textColor: Colors.white, color: Colors.black54,) ),

        ],
      ),
    );
  }
}
