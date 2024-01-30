import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/constant/theme.dart';
import 'package:shop_app/constant/widgets/button.dart';
import 'package:shop_app/pages/sign_in/widgets/sign_in_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          SizedBox(
            height: 40.h,
          ),
          buildThirdPartyLogin(context),
          SizedBox(
            height: 12.h,
          ),
          reusableText(context, 'Or use your email account to login'),
          SizedBox(
            height: 60.h,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                reusableText(context, 'Email'),
                SizedBox(
                  height: 5.h,
                ),
                buildTextField(
                    context, 'Enter your email address', Icons.person, true),
                SizedBox(
                  height: 12.h,
                ),
                reusableText(context, 'Password'),
                SizedBox(
                  height: 5.h,
                ),
                buildTextField(
                    context, 'Enter your password', Icons.lock, false),
                SizedBox(
                  height: 5.h,
                ),
                buildForgotButton(context),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: buildButton(context, 'Sign In', primaryElement),
                ),
                SizedBox(height: 14.h,),
                SizedBox(
                  width: double.infinity,
                  child: buildButton(context, 'Sign Up', Colors.transparent),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
