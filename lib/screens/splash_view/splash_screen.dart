import 'package:daryo_uz_clone/controllers/splash_controller.dart';
import 'package:daryo_uz_clone/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SplashController.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(
                    "assets/images/daryo_logo.png",
                  ),
                  height: 80,
                ),
                const SizedBox(width: 10),
                Text(
                  "DARYO",
                  style: TextStyle(
                      color: AppColors.titleColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Hodisalar.Faktlar.Qahramonlar",
              style: TextStyle(color: AppColors.subtitleColor, fontSize: 16),
            ),
            const SizedBox(height: 6),
            const Text(
              "Mamlakatimizdagi va dunyoning asosiy yangiliklari",
              style: TextStyle(color: AppColors.subtitleColor, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
