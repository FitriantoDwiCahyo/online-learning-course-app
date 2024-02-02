import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/constant/theme.dart';
import 'package:shop_app/constant/widgets/snackbar.dart';

import '../../bloc/auth/auth_bloc.dart';

Widget buildButton(
    BuildContext context, String text, Color color, VoidCallback button) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: EdgeInsets.symmetric(vertical: 18.h),
    ),
    onPressed: button,
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
                  strokeWidth: 3, // Sesuaikan ketebalan garis sesuai kebutuhan
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: primaryElementText),
              );
      },
    ),
  );
}
