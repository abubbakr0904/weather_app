import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/utils/extentions/extention.dart';
import 'package:weather_app/utils/images/images.dart';
import 'data/modelss/one_call/one_call_models/one_call_data_models.dart';
import 'data/repository/repositorty.dart';
import 'data/response.dart';

class Days7 extends StatefulWidget {
  const Days7({super.key});
  @override
  State<Days7> createState() => _Days7State();
}

class _Days7State extends State<Days7> {
  final WeatherRepository weatherRepository = WeatherRepository();
  int c = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : FutureBuilder<MyResponse>(
        future: weatherRepository.getComplexWeatherInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            OneCallDataModels oneCallData =
            (snapshot.data as MyResponse).data as OneCallDataModels;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                      left: 20.w,
                      bottom: 20.h,
                    ),
                    child: Text(
                      "Days",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  ...List.generate(
                      oneCallData.dailyModels.length,
                          (index) => Container(
                            padding: EdgeInsets.all(20.w),
                            margin: EdgeInsets.only(
                              bottom: 20.h
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.r)
                              ),
                              color : Theme.of(context).cardColor
                              ),
                            child : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  oneCallData.dailyModels[index].dt.toInt().getParsedDate(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: AppImages.fontName,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding : EdgeInsets.all(8.w),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(15.r)
                                          ),
                                          border: Border.all(
                                            width: 1,
                                            color : Colors.black
                                          )
                                        ),
                                        child: Text(
                                          oneCallData.timezone,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: AppImages.fontName,
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ),
                                      Image.network(oneCallData.dailyModels[index].inWeatherModel[0].icon.getWeatherIconUrl())
                                    ],
                                ),
                                Text(
                                  oneCallData.dailyModels[index].tempModel.day.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: AppImages.fontName,
                                    fontSize: 30.sp,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.wind_power,
                                                color : Colors.white
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Text(
                                                "Wind: ${oneCallData.dailyModels[index].windSpeed}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: "Poppins"),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 50.w,),
                                          Row(
                                            children: [
                                              SvgPicture.asset(AppImages.cloud),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Text(
                                                "Humidity: ${oneCallData.dailyModels[index].humidity}",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: "Poppins"),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ))
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
