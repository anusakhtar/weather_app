import 'package:flutter/material.dart';
import 'package:weather_app/Resources/AppColors/app_colors.dart';
import 'package:weather_app/Resources/Images/image_assets.dart';
import 'package:weather_app/ViewModel/Services/SplashScreen/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashServices.getApiData();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppColors.buildGradientBoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Image.asset(
            ImageAssets.nightStatRain,
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
