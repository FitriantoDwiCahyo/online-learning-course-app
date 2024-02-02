import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/pages/sign_up/widgets/sign_up_widgets.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../constant/widgets/snackbar.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController passconfirmC = TextEditingController();
  TextEditingController usernameC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        padding: EdgeInsets.all(24.w),
        children: [
          SizedBox(
            height: 24.h,
          ),
          reusableText(context, 'Enter your details below & free sign up'),
          SizedBox(
            height: 24.h,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                reusableText(context, 'Username'),
                SizedBox(
                  height: 5.h,
                ),
                buildTextField(context, 'Enter your username', Icons.person,
                    true, usernameC),
                SizedBox(
                  height: 12.h,
                ),
                reusableText(context, 'Email'),
                SizedBox(
                  height: 5.h,
                ),
                buildTextField(context, 'Enter your email address', Icons.email,
                    true, emailC),
                SizedBox(
                  height: 12.h,
                ),
                reusableText(context, 'Password'),
                SizedBox(
                  height: 5.h,
                ),
                buildTextField(
                    context, 'Enter your password', Icons.lock, false, passC),
                SizedBox(
                  height: 12.h,
                ),
                reusableText(context, 'Confirm Password'),
                SizedBox(
                  height: 5.h,
                ),
                buildTextField(context, 'Re-enter your password to confirm',
                    Icons.lock, false, passconfirmC),
              ],
            ),
          ),
          SizedBox(height: 24.h,),
          Align(
            alignment: Alignment.centerLeft,
            child: reusableText(context,
                'By creating an account you have to agree'),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: reusableText(context,
                'with out them & condition'),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(24.w),
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},

          // style: Theme.of(context).elevatedButtonTheme.style,
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthError) {
                buildSnackBar(context, state.error, true);
              }
            },
            builder: (context, state) {
              return state is AuthLoading
                  ? SizedBox(
                      width: 14.w, // Sesuaikan ukuran lebar sesuai kebutuhan
                      height: 14.h, // Sesuaikan ukuran tinggi sesuai kebutuhan
                      child: const CircularProgressIndicator(
                        strokeWidth:
                            3, // Sesuaikan ketebalan garis sesuai kebutuhan
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Text('Sign Up');
            },
          ),
        ),
      ),
    );
  }
}
