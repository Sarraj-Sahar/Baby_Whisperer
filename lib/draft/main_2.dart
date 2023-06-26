// import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
// import 'package:amplify_authenticator/amplify_authenticator.dart';
// import 'package:amplify_flutter/amplify_flutter.dart';
// import 'package:baby_cry/amplifyconfiguration.dart';
// import 'package:baby_cry/screens/home/home_screen.dart';
// import 'package:baby_cry/screens/welcome/welcome_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   bool isAmplifySuccessfullyConfigured = false;
//   try {
//     await _configureAmplify();
//     isAmplifySuccessfullyConfigured = true;
//   } on AmplifyAlreadyConfiguredException {
//     debugPrint('Amplify configuration failed.');
//   }
//   runApp(
//     ProviderScope(
//       child: BabyCryApp(
//         isAmplifySuccessfullyConfigured: isAmplifySuccessfullyConfigured,
//       ),
//     ),
//   );
// }

// Future<void> _configureAmplify() async {
//   await Amplify.addPlugins([AmplifyAuthCognito()]);

//   try {
//     await Amplify.configure(amplifyconfig);
//   } catch (e) {
//     print("Amplify is already configured");
//   }
// }

// class BabyCryApp extends StatelessWidget {
//   const BabyCryApp({
//     super.key,
//     required this.isAmplifySuccessfullyConfigured,
//   });
//   final bool isAmplifySuccessfullyConfigured;

//   @override
//   Widget build(BuildContext context) {
//     //
//     final _router = GoRouter(
//       routes: [
//         //Unauthenticated route -> splash screen
//         GoRoute(
//           //path has param support
//           path: '/',
//           builder: (context, state) => isAmplifySuccessfullyConfigured
//               ? const IntroScreen()
//               : const Scaffold(
//                   body: Center(
//                     child: Text(
//                       'Tried to reconfigure Amplify; '
//                       'this can occur when your app restarts on Android.',
//                     ),
//                   ),
//                 ),
//         ),
// //
//         GoRoute(
//           path: '/home',
//           builder: (BuildContext _, GoRouterState __) {
//             return const AuthenticatedView(child: HomeScreen());
//           },
//         ),
//       ],
//       errorBuilder: (context, state) => Scaffold(
//         body: Center(
//           child: Text(state.error.toString()),
//         ),
//       ),
//     );

//     return Authenticator(
//       child: MaterialApp.router(
//         debugShowCheckedModeBanner: false,
//         title: 'Baby Cry',
//         //  Authenticator.builder() will make all routes in your application require authentication.
//         builder: Authenticator.builder(),
//         routeInformationProvider: _router.routeInformationProvider,
//         routeInformationParser: _router.routeInformationParser,
//         routerDelegate: _router.routerDelegate,
//       ),
//     );
//   }
// }

// // MaterialApp(
// //   debugShowCheckedModeBanner: false,
// //   title: 'Baby Cry',
// //   builder: Authenticator.builder(),
// //   routes: {
// //     '/': (context) => const IntroScreen(),
// //     '/home': (context) => const AuthenticatedView(child: HomeScreen()),
// //     '/phone': (context) => const PhoneNumberScreen(),
// //   },
// // ),
