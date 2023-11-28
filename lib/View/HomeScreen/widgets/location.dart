import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Resources/Images/image_assets.dart';
import 'package:weather_app/Utilties/utilties.dart';
import 'package:weather_app/ViewModel/Controllers/home_controller.dart';

class Location extends StatelessWidget {
  Location({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.getAddress(),
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              Utilties.formatDate(DateTime.now()),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey.withOpacity(.7),
              ),
            ),
          ],
        ),
        Spacer(),
        SizedBox(
          height: 150,
          width: 150,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                ImageAssets.map,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
}
