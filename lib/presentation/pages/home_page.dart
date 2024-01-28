import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/logic/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/widgets/background_filter.dart';
import 'package:weather_app/presentation/widgets/bottom_section.dart';
import 'package:weather_app/presentation/widgets/middle_section.dart';
import 'package:weather_app/presentation/widgets/top_section.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1 * kToolbarHeight, 40, 20),
        child: Stack(
          children: [
            ...HomePageBackgroundFilter(context: context).getFilter(),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state is WeatherSuccess) {
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Top Section
                          SlideInUp(
                            duration: const Duration(milliseconds: 600),
                            child: TopSection(
                                location: state.weather.areaName.toString()),
                          ),

                          // Middle Section
                          SlideInUp(
                            duration: const Duration(milliseconds: 900),
                            child: MiddleSection(
                              degree: state.weather.temperature!.celsius!
                                  .round()
                                  .toString(),
                              weatherType:
                                  state.weather.weatherMain!.toUpperCase(),
                              image: getWeatherIcon(
                                  state.weather.weatherConditionCode!),
                              time: DateFormat('EEEE dd .')
                                  .add_jm()
                                  .format(state.weather.date!),
                            ),
                          ),

                          const SizedBox(
                            height: 40,
                          ),

                          // Bottom Section
                          SlideInUp(
                            duration: const Duration(milliseconds: 1200),
                            child: BottomSection(
                              sunriseTime: DateFormat()
                                  .add_jm()
                                  .format(state.weather.sunrise!),
                              sunsetTime: DateFormat()
                                  .add_jm()
                                  .format(state.weather.sunset!),
                              tempMax: state.weather.tempMax!.celsius!
                                  .round()
                                  .toString(),
                              tempMin: state.weather.tempMin!.celsius!
                                  .round()
                                  .toString(),
                            ),
                          )
                        ]);
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  String getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return 'assets/1.png';
      case >= 300 && < 400:
        return 'assets/2.png';
      case >= 500 && < 600:
        return 'assets/3.png';
      case >= 600 && < 700:
        return 'assets/4.png';
      case >= 700 && < 800:
        return 'assets/5.png';
      case == 800:
        return 'assets/6.png';
      case > 800 && <= 804:
        return 'assets/7.png';
      default:
        return 'assets/7.png';
    }
  }
}
