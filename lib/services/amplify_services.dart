import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:baby_cry/amplifyconfiguration.dart';
import 'package:baby_cry/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_datastore/amplify_datastore.dart';

//configuring amplify : adding all required amplify plugins
Future<void> configureAmplify() async {
  await Amplify.addPlugins([
    // Create the Auth plugin.
    AmplifyAuthCognito(),
    // Added the Amplify DataStore (on-device storage engine that synchronizes data between the mobile phone and the database in the AWS Cloud)
    AmplifyDataStore(modelProvider: ModelProvider.instance),
    // Create the API plugin.
    AmplifyAPI(modelProvider: ModelProvider.instance),
  ]);
  // Once Plugins are added, configure Amplify
  // Note: Amplify can only be configured once.
  try {
    await Amplify.configure(amplifyconfig);
  } catch (e) {
    print("Amplify is already configured");
  }
}
