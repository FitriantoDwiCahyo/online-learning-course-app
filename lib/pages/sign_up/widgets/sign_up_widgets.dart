import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/theme.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: primarySecondaryBackground,
        height: 1.0,
      ),
    ),
    title: Text(
      'Register',
      style: Theme.of(context).textTheme.titleMedium,
    ),
  );
}

Widget reusableText(BuildContext context, String text) {
  return Container(
    child: Text(
      text,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Colors.grey.withOpacity(0.7),
          ),
      textAlign: TextAlign.center,
    ),
  );
}

Widget buildTextField(BuildContext context, String text, IconData icon,
    bool isEmail, TextEditingController controller) {
  bool isSuffixShow = true;

  return Container(
    width: double.infinity,
    height: 50.h,
    padding: EdgeInsets.symmetric(horizontal: 8.w),
    decoration: BoxDecoration(
      // color: Colors.amber,
      borderRadius: BorderRadius.circular(15.w),
      border: Border.all(color: primaryText),
    ),
    child: Row(
      children: [
        Icon(
          icon,
          color: primaryText,
        ),
        SizedBox(
          width: 5.w,
        ),
        Expanded(
          child: StatefulBuilder(builder: (context, setState) {
            return TextField(
              // onChanged: (value) => func!(value),
              controller: controller,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintText: text,
                suffixIcon: isEmail
                    ? const SizedBox()
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            if (isSuffixShow) {
                              isSuffixShow = false;
                            } else {
                              isSuffixShow = true;
                            }
                          });
                        },
                        icon: Icon(isSuffixShow
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined),
                      ),
              ),
              autocorrect: false,
              obscureText: isEmail
                  ? false
                  : isSuffixShow == true
                      ? true
                      : false,
              style: Theme.of(context).textTheme.bodyMedium,
            );
          }),
        )
      ],
    ),
  );
}

