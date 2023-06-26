import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:baby_cry/amplifyconfiguration.dart';
import 'package:baby_cry/models/ModelProvider.dart';
import 'package:baby_cry/providers/user_provider.dart';
import 'package:baby_cry/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_datastore/amplify_datastore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isAmplifySuccessfullyConfigured = false;
  try {
    await _configureAmplify();
    isAmplifySuccessfullyConfigured = true;
  } on AmplifyAlreadyConfiguredException {
    debugPrint('Amplify configuration failed.');
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: BabyCryApp(
        isAmplifySuccessfullyConfigured: isAmplifySuccessfullyConfigured,
      ),
    ),
  );
}

Future<void> _configureAmplify() async {
  await Amplify.addPlugins([
    AmplifyAuthCognito(),
    AmplifyDataStore(modelProvider: ModelProvider.instance),
    AmplifyAPI(),
  ]);

  try {
    await Amplify.configure(amplifyconfig);
  } catch (e) {
    print("Amplify is already configured");
  }
}

class BabyCryApp extends StatelessWidget {
  const BabyCryApp({
    super.key,
    //a flag to check if amplify is configured or not
    required this.isAmplifySuccessfullyConfigured,
  });
  final bool isAmplifySuccessfullyConfigured;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Baby Cry',
      home: WelcomeScreen(),
    );
  }
}
