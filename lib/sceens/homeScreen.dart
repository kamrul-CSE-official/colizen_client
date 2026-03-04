import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/home_controller.dart';
import 'package:flutter_application_1/sceens/loginScreen.dart';
import 'package:flutter_application_1/widgets/CurveClipper.dart';
import 'package:flutter_application_1/widgets/button.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  final controller = Get.put(HomeController());

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ১. কন্ট্রোলার এবং ডাটা এখানে থাকবে (Build মেথডের বাইরে)
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Send Your Parcels \nIn Just A Few Taps',
      'image': "assets/image 1.png",
      'subTitle':
          'Effortlessly schedule deliveries and track them in\nreal-time, all from the comfort of your phone.',
    },
    {
      'title': 'Experience The Fast and \nReliable Deliveries',
      'image': "assets/image 2.png",
      'subTitle':
          'Count on us to get your parcels delivered\nquickly and securely, every single time.',
    },
    {
      'title': 'Affordable Pricing With\nReal-Time Tracking',
      'image': "assets/image 3.png",
      'subTitle':
          'Know exactly where your package is and when\nit will arrive with live tracking updates.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // ২. PageView.builder ব্যবহার করে স্লাইডিং পেজ তৈরি
          PageView.builder(
            controller: _pageController,
            itemCount: onboardingData.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index; // পেজ পরিবর্তন হলে ইনডেক্স আপডেট হবে
              });
            },
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ClipPath(
                    clipper: MyClipper(),
                    child: SizedBox(
                      height: height * 0.5, // স্ক্রিনের ৬০% ছবি নিবে
                      child: Image.asset(
                        onboardingData[index]['image']!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    onboardingData[index]['title']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    onboardingData[index]['subTitle']!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              );
            },
          ),

          // ডটগুলোকে এখানে Positioned দিয়ে বসান
          Positioned(
            bottom: 160, // বাটনের একটু উপরে রাখার জন্য 160 পিক্সেল দিলাম
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => buildDot(index),
              ),
            ),
          ),

          // ৩. বাটন এবং ডট ইন্ডিকেটর (স্থির থাকবে)
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: CustomButton(
              text: _currentPage == 2 ? "Get Start" : "Next",
              borderRadius: BorderRadius.all(Radius.circular(50.0)),

              onTap: () {
                if (_currentPage == 2) {
                  // শেষ পেজে থাকলে হোম পেজে নিয়ে যান
                  Get.to(() => LoginScreen());
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  // ডট তৈরির হেল্পার উইজেট
  Widget buildDot(int index) {
    return Container(
      height: 8,
      width: _currentPage == index ? 30 : 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: _currentPage == index ? Colors.black : Colors.grey[300],
      ),
    );
  }
}
