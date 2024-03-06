import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/data/modelss/one_call/one_call_models/one_call_data_models.dart';
import 'package:weather_app/data/modelss/simple/weather_model/weather_model.dart';
import 'package:weather_app/days7.dart';
import 'package:weather_app/utils/extentions/extention.dart';
import 'package:weather_app/utils/images/images.dart';

import 'data/repository/repositorty.dart';
import 'data/response.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final WeatherRepository weatherRepository = WeatherRepository();
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<MyResponse>(
              future: weatherRepository.getSimpleWeatherInfo("Tashkent"),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                if (snapshot.hasData) {
                  WeatherM weatherMainModel =
                      (snapshot.data as MyResponse).data as WeatherM;
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r))),
                        margin:
                            EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
                        padding: EdgeInsets.all(10.w),
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    AppImages.back,
                                  ),
                                  Text(weatherMainModel.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontSize: 20.sp,
                                          )),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.w, vertical: 7.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.r),
                                  ),
                                  color: Theme.of(context).cardColor),
                              child: Text(
                                weatherMainModel.dt.getParsedDate().toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(fontSize: 10.sp),
                              ),
                            ),
                            Container(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.network(
                                    weatherMainModel.inWeather[0].icon
                                        .getWeatherIconUrl(),
                                    width: 150.w,
                                    color: Colors.white,
                                    fit: BoxFit.cover),
                                Text(
                                  "${(weatherMainModel.mainModel.temp - 273.15).toStringAsFixed(2)} C",
                                  style: TextStyle(
                                      fontFamily: AppImages.fontName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 35.sp,
                                      color: Colors.white),
                                ),
                              ],
                            )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(AppImages.cloud),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "Precipitation: 21%",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: 13.sp),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(AppImages.cloud),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                        "Humidity: ${weatherMainModel.mainModel.humidity}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(fontSize: 13.sp)),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(AppImages.big_sun),
                                    SizedBox(
                                      width: 13.w,
                                    ),
                                    Text(
                                      "Wind: 10 km/h",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: 10.sp),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(AppImages.moon),
                                    SizedBox(
                                      width: 13.w,
                                    ),
                                    Text(
                                      "Sunset: 29%",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: 10.sp),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            FutureBuilder<MyResponse>(
              future: weatherRepository.getComplexWeatherInfo(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  OneCallDataModels oneCallData =
                      (snapshot.data as MyResponse).data as OneCallDataModels;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              ...List.generate(
                                30,
                                (index) => Text(
                                  " -",
                                  style: TextStyle(
                                      color: Theme.of(context).cardColor,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w300),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.h,
                            ),
                            ...List.generate(
                              15,
                              (index) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 5.w),
                                padding: EdgeInsets.all(10.w),
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .cardColor
                                        .withOpacity(0.2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                child: Column(
                                  children: [
                                    Text(
                                      oneCallData.hourlyModels[index].dt
                                          .toInt()
                                          .getParsedHour(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: 15.sp),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Image.network(
                                        oneCallData.hourlyModels[index]
                                            .inWeather[0].icon
                                            .getWeatherIconUrl(),
                                        width: 70.w,
                                        fit: BoxFit.cover),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      oneCallData.hourlyModels[index].temp
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: 15.sp),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.amber),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Days7()));
                              },
                              child: Text("7 days report",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontSize: 15.sp)),
                            ),
                            Switch(
                              value: isDark,
                              onChanged: (v) async {
                                if (v) {
                                  AdaptiveTheme.of(context).setDark();
                                } else {
                                  AdaptiveTheme.of(context).setLight();
                                }
                                isDark = v;
                              },
                            ),
                          ],
                        ),
                      ),
                      ...List.generate(
                          oneCallData.dailyModels.length,
                          (index) => Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)),
                                  color: Theme.of(context)
                                      .cardColor
                                      .withOpacity(0.5)),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 5.h),
                              padding: EdgeInsets.all(10.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      oneCallData.dailyModels[index].dt
                                          .toInt()
                                          .getParsedDateDay(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(fontSize: 20.sp)),
                                  Image.network(
                                    oneCallData.dailyModels[index]
                                        .inWeatherModel[0].icon
                                        .getWeatherIconUrl(),
                                    height: 50.h,
                                    fit: BoxFit.cover,
                                  ),
                                ],
                              )))
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
