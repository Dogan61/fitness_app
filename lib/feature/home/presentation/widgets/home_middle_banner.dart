import 'package:fitness_app/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeMiddleBanner extends StatelessWidget {
  const HomeMiddleBanner({
    super.key,
    this.challengeTitle = 'Weekly\nChallenge',
    this.challengeSubtitle = 'Plank With Hip Twist',
    this.imagePath = 'assets/images/ic_training_1.png',
  });

  final String challengeTitle;
  final String challengeSubtitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: double.infinity,
      color: AppConstants.authPurple,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: Container(
          height: 140,
          decoration: BoxDecoration(
            color: AppConstants.authBackground,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        challengeTitle,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.limeAccent,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        challengeSubtitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                child: Image.asset(
                  imagePath,
                  width: 140,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
