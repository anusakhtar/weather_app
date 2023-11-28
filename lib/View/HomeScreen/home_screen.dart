import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/Resources/AppColors/app_colors.dart';
import 'package:weather_app/View/HomeScreen/widgets/appbar.dart';
import 'package:weather_app/View/HomeScreen/widgets/hours_list.dart';
import 'package:weather_app/View/HomeScreen/widgets/info_card.dart';
import 'package:weather_app/View/HomeScreen/widgets/location.dart';
import 'package:weather_app/View/Next14Days/next_14_days.dart';
import 'package:weather_app/ViewModel/Controllers/home_controller.dart';

import 'widgets/container_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppColors.buildGradientBoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomAppBar(),
                  const SizedBox(
                    height: 20,
                  ),
                  Location(),
                  const SizedBox(
                    height: 20,
                  ),
                  Hero(
                    tag: "Tag",
                    child: Material(
                      color: Colors.transparent,
                      child: InfoCard(),
                    ),
                  ),
                  ContainerList(),
                  const SizedBox(
                    height: 4,
                  ),
                  GestureDetector(
                    onTap: ()=> Get.to(()=>Next14Days()),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            'Today',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Text(
                            'Next 14 Days',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  HoursList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
