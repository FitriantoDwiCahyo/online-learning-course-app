import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/bloc/auth/auth_bloc.dart';
import 'package:shop_app/constant/theme.dart';
import 'package:shop_app/constant/widgets/button.dart';
import 'package:shop_app/constant/widgets/snackbar.dart';
import 'package:shop_app/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:shop_app/routers/router.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authB = context.read<AuthBloc>();
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
                buildTextField(context, 'Enter your email address',
                    Icons.person, true, emailC),
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
                  height: 5.h,
                ),
                buildForgotButton(context),
                SizedBox(
                  height: 12.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => authB.add(
                      SignInEvent(emailC.text, passC.text),
                    ),
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
                                width: 14
                                    .w, // Sesuaikan ukuran lebar sesuai kebutuhan
                                height: 14
                                    .h, // Sesuaikan ukuran tinggi sesuai kebutuhan
                                child: const CircularProgressIndicator(
                                  strokeWidth:
                                      3, // Sesuaikan ketebalan garis sesuai kebutuhan
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              )
                            : Text('Log In');
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => context.goNamed(Routes.signUp),
                    child: const Text('Register'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
