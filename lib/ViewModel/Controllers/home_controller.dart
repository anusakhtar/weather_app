import 'dart:async';

import 'package:get/get.dart';
import 'package:weather_app/Model/data_model.dart';
import 'package:weather_app/Repository/home_repository.dart';
import 'package:weather_app/Resources/Images/image_assets.dart';
import 'package:weather_app/Utilties/utilties.dart';
import 'package:weather_app/View/HomeScreen/home_screen.dart';

class HomeController extends GetxController {
  Rx<DataModel?> model = Rx<DataModel?>(null);
  Rx<Hours?> hours = Rx<Hours?>(null);
  Rx<int> currentIndex = 0.obs;
  RxBool animator = false.obs;

  get i => null;

  int getCurrentIndex() => currentIndex.value;
  bool compareIndex(int index) => index == currentIndex.value;
  String getHour(int index) => Utilties.formatTimeWithoutAmPm(
      model.value!.days![0].hours![index].datetime.toString());
  String getImage(int index) => Utilties().imageMap[
              model.value!.days![0].hours![index].conditions.toString()] ==
          null
      ? ImageAssets.nightStatRain
      : Utilties()
          .imageMap[model.value!.days![0].hours![index].conditions.toString()]!;
  String getAddress()=> "${model.value!.address.toString()},\n${model.value!.timezone.toString()}";
  String getCondition()=> hours.value!.conditions.toString();
  String getCurrentTemp()=> hours.value!.temp!.toInt().toString();
  String getFeelLike()=> hours.value!.conditions.toString();
  String getCloudCover()=> hours.value!.cloudcover!.toInt().toString();
  String getWindSpeed()=> hours.value!.windspeed!.toInt().toString();
  String getHumidity()=> hours.value!.humidity!.toInt().toString();

  getData(){
    HomeRepository.hitApi().then((value){
      model.value= DataModel.fromJson(value);
      for(int i=0;i<model.value!.days![0].hours!.length;i++){
        if(Utilties.checkTime(model.value!.days![0].hours![i].datetime.toString())){
          hours.value=model.value!.days![0].hours![i];
          currentIndex.value = i;
          break;
        }
      }
    Get.to(()=>const HomeScreen());
    });
  }
  setHour(int index){
    Timer(const Duration( milliseconds: 100), ()=> animator.value= true);
    currentIndex.value= index;
    hours.value=model.value!.days![0].hours![i];
    Timer(const Duration( milliseconds: 100), ()=> animator.value= false);
  }
}
