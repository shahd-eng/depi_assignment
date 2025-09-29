import 'package:depi_assignment/custom_widgets/custom_button.dart';
import 'package:depi_assignment/screens/login_screen.dart';
import 'package:depi_assignment/screens/signup_screen.dart';
import 'package:depi_assignment/utils/app_colors.dart';
import 'package:depi_assignment/utils/app_images.dart';
import 'package:depi_assignment/utils/app_routes.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffefefe),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset(AppImages.welcomeImage)),
            Text(
              'Welcome to Characterverse',
              style: Theme.of(context).textTheme.titleLarge!,
              textAlign: TextAlign.center,
            ),
            Text(
              'Discover and dive into the lore of the most iconic fictional characters across all media',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CustomButton(
              onTap: () {
                Navigator.pushReplacementNamed(context, AppRoutes.logIn);
              },
              color:AppColors.mainColor,
              textStyle: Theme.of(
                context,
              ).textTheme.bodyMedium!.copyWith(color: AppColors.primaryTextColor,fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context,AppRoutes.signUp );
              },
              child: Text(
                "Create an account",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(color: AppColors.primaryTextColor,fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
