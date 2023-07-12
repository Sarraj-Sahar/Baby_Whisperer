import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:baby_cry/providers/user_provider.dart';
import 'package:baby_cry/screens/auth/sign_in_screen.dart';
import 'package:baby_cry/screens/auth/verification_screen.dart';
import 'package:baby_cry/shared/constants.dart';
import 'package:baby_cry/shared/extentions.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

class BabyProfileForm extends StatefulWidget {
  const BabyProfileForm({
    Key? key,
  }) : super(key: key);

  @override
  State<BabyProfileForm> createState() => _BabyProfileFormState();
}

class _BabyProfileFormState extends State<BabyProfileForm> {
  final _formKey = GlobalKey<FormState>();
  late String _username, _email, _password;

  void signUp(String username, String password, String email) async {
    final signUpResult =
        await context.read<UserProvider>().signUp(username, password, email);
    signUpResult.fold(
      (error) => context.showError(error),
      (step) {
        if (step.nextStep.signUpStep == AuthSignUpStep.confirmSignUp) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => VerificationScreen(username: username),
            ),
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
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
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
                hintText: 'Baby\'s Nickname'),
            onSaved: (username) {
              _username = username!;
            },
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            validator: RequiredValidator(errorText: requiredField),
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
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
                hintText: 'Baby\'s Birthdate'),
            onSaved: (username) {
              _username = username!;
            },
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            validator: RequiredValidator(errorText: requiredField),
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
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
                hintText: 'Country'),
            onSaved: (username) {
              _username = username!;
            },
          ),
          //
          const SizedBox(height: defaultPadding),

          TextFormField(
            validator: RequiredValidator(errorText: requiredField),
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
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
                hintText: 'Zip code'),
            onSaved: (username) {
              _username = username!;
            },
          ),
          const SizedBox(height: defaultPadding),
          Container(
            alignment: Alignment(-0.95, 0),
            child: Text(
              "it's a",
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Row(
            children: [
              TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {},
                  child: Text(
                    "girl",
                    style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                  )),
              SizedBox(
                width: 20,
              ),
              TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {},
                  child: Text(
                    "boy",
                    style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 175),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kprimaryColor)),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  signUp(_username, _password, _email);
                }
              },
              child: context.watch<UserProvider>().isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Continue"),
            ),
          ),
        ],
      ),
    );
  }
}
