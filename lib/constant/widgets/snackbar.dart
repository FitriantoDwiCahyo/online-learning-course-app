import 'package:flutter/material.dart';

void buildSnackBar(BuildContext context, String message,bool isError) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Center(child: Text(message)),
      backgroundColor: isError != true? Colors.green : Colors.red,
      duration: const Duration(seconds: 2), // Sesuaikan durasinya sesuai kebutuhan
    ),
  );
}
