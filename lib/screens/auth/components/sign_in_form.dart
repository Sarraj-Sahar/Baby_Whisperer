import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:baby_cry/providers/user_provider.dart';
import 'package:baby_cry/screens/home/home_screen.dart';
import 'package:baby_cry/shared/constants.dart';
import 'package:baby_cry/shared/extentions.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  late String _username, _password;

  void signIn({required String username, required String password}) async {
    final signInResponse = await context
        .read<UserProvider>()
        .signIn(username: username, password: password);

    signInResponse.fold(
      (error) => context.showError(error),
      (signInResult) {
        if (signInResult.nextStep.signInStep == AuthSignInStep.done) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
            (route) => false,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: RequiredValidator(errorText: requiredField),
            decoration: InputDecoration(
                focusColor: kprimaryColor.withOpacity(0.2),
                disabledBorder: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kprimaryColor),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Username'),
            textInputAction: TextInputAction.next,
            onSaved: (username) {
              _username = username!;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              validator: RequiredValidator(errorText: "Password is required"),
              obscureText: true,
              decoration: InputDecoration(
                  focusColor: kprimaryColor.withOpacity(0.2),
                  disabledBorder: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kprimaryColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Password'),
              onSaved: (passaword) {
                _password = passaword!;
              },
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(kprimaryColor)),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                signIn(username: _username, password: _password);
              }
            },
            child: context.watch<UserProvider>().isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text("Sign In"),
          ),
        ],
      ),
    );
  }
}
