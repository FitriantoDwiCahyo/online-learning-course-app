import 'package:go_router/go_router.dart';
import 'package:shop_app/pages/sign_in/sign_in_page.dart';
import 'package:shop_app/pages/sign_up/sign_up_page.dart';
import 'package:shop_app/pages/welcome_page/welcome_page.dart';

part 'route_name.dart';

final router = GoRouter(routes: [
  GoRoute(
      path: '/',
      name: Routes.welcome,
      builder: (context, state) => WelcomePage(),
      routes: [
        GoRoute(
            path: 'login',
            name: Routes.signIn,
            builder: (context, state) => SignInPage(),
            routes: [
              GoRoute(
                path: 'register',
                name: Routes.signUp,
                builder: (context, state) => SignUpPage(),
              ),
            ]),
      ]),
]);
