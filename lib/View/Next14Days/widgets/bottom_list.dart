import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/ViewModel/Controllers/days_controller.dart';
import 'package:weather_app/ViewModel/Controllers/home_controller.dart';

class BottomList extends StatelessWidget {
  final homeController = Get.put(HomeController());
  final controller = Get.put(DaysController());
  BottomList({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 1,
      child: SizedBox(
        height: size.height / 2,
        width: size.width,
        child: ListView.builder(
            itemCount: homeController.model.value!.days!.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white38,
                margin: EdgeInsets.only(
                    left: 20, right: 20, top: index == 0 ? 230 : 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  width: size.width,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white38,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        controller.getDate(index),
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: controller.getMinTemp(index),
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: '/',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: controller.getMaxTemp(index),
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(.5),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        controller.getImage(index),
                        width: 70,
                        height: 70,
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
