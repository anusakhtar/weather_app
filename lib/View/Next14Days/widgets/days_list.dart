import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/ViewModel/Controllers/days_controller.dart';

class DaysList extends StatelessWidget {
  final controller = Get.put(DaysController());
  DaysList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.homeController.model.value!.days!.length,
        itemBuilder: (context, index) {
          return Obx(() => GestureDetector(
                onTap: (){ controller.setDay(index);},
                child: Container(
                  width: 70,
                  margin: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    color: controller.currentDay.value == index
                        ? Colors.white
                        : Colors.white12,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          controller.getImage(index),
                        ),
                      ),
                      Text(
                        controller.getMonth(index),
                        style: TextStyle(
                          color: controller.currentDay.value == index
                              ? Colors.purple
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 0,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        controller.getMonthDay(index),
                        style: TextStyle(
                          color: controller.currentDay.value == index
                              ? Colors.purple
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 0,
                          fontSize: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
