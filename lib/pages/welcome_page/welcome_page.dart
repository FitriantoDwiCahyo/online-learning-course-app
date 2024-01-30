import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/constant/theme.dart';
import 'package:shop_app/pages/welcome_page/item_page.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../bloc/welcome/welcome_bloc.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Stack(
              alignment: Alignment.center,
              children: [
                PageView(

                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    context.read<WelcomeBloc>().add(DotsDecoratorEvent());
                    print('${state.page}');
                  },
                  children: [
                    ItemPage(
                      1,
                      'First see Learning',
                      'Forget about a for of paper all knowldget in on learning',
                      'assets/images/reading.png',
                      pageController
                    ),
                    ItemPage(
                      2,
                      'Connect With Everyone',
                      'Always keep in touch with your tutor % firend. Let get connected',
                      'assets/images/boy.png',
                      pageController
                    ),
                    ItemPage(
                      3,
                      'Get Started',
                      'Anywhere, anytime. The time is at our dicription so study whenever you want',
                      'assets/images/man.png',
                      pageController
                    ),
                  ],
                ),
                Positioned(
                  bottom: 100,
                  child: DotsIndicator(
                    
                    position: state.page,
                    dotsCount: 3,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeColor: primaryElement,
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
