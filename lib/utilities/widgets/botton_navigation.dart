import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skincare_task/utilities/utilities.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: AppColors.background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: true,
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/Home.svg",
              height: 24,
              width: 24,
            ),

            // height: 24,
            // width: 24,
            iconSize: 30,
          ),
          IconButton(
            enableFeedback: true,
            onPressed: () {},
            icon: Image.asset("assets/icons/heart.png", height: 24, width: 24),

            // height: 24,
            // width: 24,
            iconSize: 30,
          ),

          IconButton(
            enableFeedback: true,
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/element-3.svg",
              height: 24,
              width: 24,
            ),

            // height: 24,
            // width: 24,
            iconSize: 30,
          ),
          IconButton(
            enableFeedback: true,
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/icons/Profile (1).svg",
              height: 24,
              width: 24,
            ),

            // height: 24,
            // width: 24,
            iconSize: 30,
          ),
        ],
      ),
    );
  }
}
