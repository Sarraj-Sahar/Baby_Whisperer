import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:baby_talk/screens/home-screen.dart';
import 'package:baby_talk/screens/mobile-register-screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/intro-screen.dart';

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
//       child: MyApp(
//         isAmplifySuccessfullyConfigured: isAmplifySuccessfullyConfigured,
//       ),
//     ),
//   );
// }

// Future<void> _configureAmplify() async {
//   await Amplify.addPlugins([
//     AmplifyAuthCognito(),
//   ]);
//   await Amplify.configure(
//       amplifyconfig); //this should be inside amplifyConfiguration.dart
// }

///
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Baby Translate',
      home: const IntroScreen(),
      routes: {
        '/home': (context) => const HomePage(),
        '/mobile': (context) => const MobileSignUpScreen(),
      },
    );
  }
}
