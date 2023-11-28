import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/ViewModel/Controllers/home_controller.dart';

class HoursList extends StatelessWidget {
  HoursList({super.key});
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: ListView.builder(
          itemCount: controller.model.value!.days![0].hours!.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                controller.setHour(index);
              },
              child: Column(
                children: [
                  Obx(
                    () => Card(
                      elevation: 10,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      shadowColor: controller.compareIndex(index)
                          ? Colors.blue
                          : Colors.white70,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Container(
                        width: 80,
                        height: 130,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: controller.compareIndex(index)
                              ? Colors.blue
                              : Colors.white70,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Text(
                                controller.getHour(index),
                                style: TextStyle(
                                  color: controller.compareIndex(index)
                                      ? Colors.white
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Obx(
                              () => Image.asset(
                                controller.getImage(index),
                                width: 50,
                                height: 50,
                              ),
                            ),
                            Text(
                              "${controller.model.value!.days![0].hours![index].temp.toInt()}\u0000",
                                style: TextStyle(
                                color: controller.compareIndex(index)
                                    ? Colors.white
                                    : Colors.grey,
                                fontWeight: FontWeight.bold,
                                  fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
