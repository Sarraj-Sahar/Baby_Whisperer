import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'services/amplify_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //a flag to check if amplify is configured or not
  bool isAmplifySuccessfullyConfigured = false;
  try {
    await configureAmplify();
    isAmplifySuccessfullyConfigured = true;
  } on AmplifyAlreadyConfiguredException {
    debugPrint('Amplify configuration failed.');
  }
  runApp(
    //this is where we place all of our app's providers
    ProviderScope(
      child: BabyCryApp(
        isAmplifySuccessfullyConfigured: isAmplifySuccessfullyConfigured,
      ),
    ),
  );
}
