import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/constant/theme.dart';
import 'package:shop_app/routers/router.dart';

class ItemPage extends StatelessWidget {
  ItemPage(
      this.index, this.title, this.content, this.imagePath, this.pageController,
      {super.key});

  int index;
  String title;
  String content;
  String imagePath;

  PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath),
        SizedBox(
          height: 12.h,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          content,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: 24.h,
        ),
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if (index < 3) {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate);
              } else {
                context.goNamed(Routes.signIn);
              }
            },
            child:
                Text(index == 3 ? 'Get Started' : 'Next'),
          ),
        ),
      ],
    );
  }
}
