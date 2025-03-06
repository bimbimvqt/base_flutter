import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_app/src/screens/on_boarding/on_boarding_controller.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: PageView(
        controller: controller.pageController,
        children: [
          _buildPage(
            title: 'Welcome',
            description: 'Welcome to our app! Let\'s get started.',
            image: 'assets/images/img_car1.jpg',
          ),
          _buildPage(
            title: 'Features',
            description: 'Discover the amazing features we offer.',
            image: 'assets/images/img_car1.jpg',
          ),
          _buildPage(
            title: 'Get Started',
            description: 'Let\'s get you set up and ready to go!',
            image: 'assets/images/img_car1.jpg',
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: controller.previousPage,
              child: const Text('Previous', style: TextStyle(color: Color(0xFF00C0DD))),
            ),
            TextButton(
              onPressed: controller.nextPage,
              child: const Text('Next', style: TextStyle(color: Color(0xFF00C0DD))),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({required String title, required String description, required String image}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF00C0DD)),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, color: Color(0xFF454545)),
          ),
          const SizedBox(height: 20),
          Image.asset(
            image,
          ),
        ],
      ),
    );
  }
}
