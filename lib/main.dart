import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:baby_cry/amplifyconfiguration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'shared/services/amplify_services.dart';

// main() is the entry point of a Flutter app
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //a flag to check if amplify is configured or not
  bool isAmplifySuccessfullyConfigured = false;
  try {
    if (Amplify.isConfigured) {
      safePrint('Amplify is already configured. Skipping configuration.');
      isAmplifySuccessfullyConfigured = true;
    } else {
      await configureAmplify();
      isAmplifySuccessfullyConfigured = true;
    }
  } on AmplifyAlreadyConfiguredException {
    debugPrint('Amplify configuration failed.');
  }
  runApp(
    //we use ProviderScope to make sure all of our providers are available
    ProviderScope(
      child: BabyCryApp(
        isAmplifySuccessfullyConfigured: isAmplifySuccessfullyConfigured,
      ),
    ),
  );
}
