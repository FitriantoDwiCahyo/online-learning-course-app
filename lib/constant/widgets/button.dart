import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/constant/theme.dart';

Widget buildButton(BuildContext context, String text,Color color) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(backgroundColor: color,padding: EdgeInsets.symmetric(vertical: 18.h),),
    onPressed: () {},
    child: Text(
      text,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(color: primaryElementText),
    ),
  );
}
