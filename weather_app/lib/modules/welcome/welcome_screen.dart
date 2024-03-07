import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/common/widgets/app_button.dart';
import 'package:weather_app/common/widgets/app_text_field.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding: const EdgeInsets.only(
          top: 100,
          left: 16,
          right: 16,
          bottom: 50,
        ),
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
                color: Colors.blueGrey[600],
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
                color: Colors.blueGrey[800],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              child: AppTextField(
                textController: TextEditingController(),
                hintText: 'City name',
              ),
            ),
            Spacer(),
            AppButton(
              onPressed: () {},
              buttonText: 'Continue',
            )
          ],
        ),
      ),
    );
  }
}
