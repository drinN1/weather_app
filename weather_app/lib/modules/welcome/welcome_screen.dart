import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/common/design/colors.dart';
import 'package:weather_app/common/widgets/app_button.dart';
import 'package:weather_app/common/widgets/app_text_field.dart';
import 'package:weather_app/modules/home/data/home_notifier.dart';
import 'package:weather_app/modules/home/home_screen.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100,
          left: 16,
          right: 16,
          bottom: 50,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 80,
                  right: 80,
                ),
                child: Image.asset(
                  'assets/images/weather_logo.webp',
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                'Welcome to Weather App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Let\'s get started by checking the weather for your location. Please enter the name of your city below, and we\'ll provide you with the latest weather updates.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                child: AppTextField(
                  textController: ref.watch(homeNotifier).cityName!,
                  hintText: 'City name',
                ),
              ),
              Visibility(
                visible: ref.read(homeNotifier).isFiledEmpty!,
                child: Text(
                  'Please don\'t leave the field empty',
                  style: TextStyle(
                    color: errorColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Visibility(
                visible: !ref.read(homeNotifier).isCityValid!,
                child: Text(
                  'City is not valid',
                  style: TextStyle(
                    color: errorColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              AppButton(
                onPressed: () {
                  if (ref.read(homeNotifier).cityName!.text.isEmpty) {
                    ref.read(homeNotifier.notifier).changeIsEmptyBool(true);
                  } else {
                    ref.read(homeNotifier.notifier).changeIsEmptyBool(false);
                    ref
                        .read(homeNotifier.notifier)
                        .getCityWeather()
                        .then((value) => ref.read(homeNotifier).isCityValid!
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              )
                            : null);
                  }
                },
                buttonText: 'Continue',
              )
            ],
          ),
        ),
      ),
    );
  }
}
