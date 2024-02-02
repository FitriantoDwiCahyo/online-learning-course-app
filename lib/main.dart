import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/bloc/auth/auth_bloc.dart';
import 'package:shop_app/bloc/welcome/welcome_bloc.dart';
import 'package:shop_app/constant/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'routers/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(create: (context) => AuthBloc())
      ],
      child: ScreenUtilInit(builder: (context, child) {
        return MaterialApp.router(
          routerConfig: router,
          theme: lightMode,
        );
      }),
    );
  }
}
