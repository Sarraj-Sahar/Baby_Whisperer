import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:baby_cry/providers/user_provider.dart';
import 'package:baby_cry/screens/auth/sign_in_screen.dart';
import 'package:baby_cry/screens/auth/verification_screen.dart';
import 'package:baby_cry/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late String _username, _email, _password;

  void signUp(String username, String password, String email) async {
    final signUpResult =
        await ref.read(userProvider).signUp(username, password, email);
    signUpResult.fold(
      (error) => context.showError(error),
      (step) {
        if (step.nextStep.signUpStep == AuthSignUpStep.confirmSignUp) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => VerificationScreen(
                username: username,
                password: password,
              ),
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
            onSaved: (username) {
              _username = username!;
            },
          ),
          const SizedBox(height: defaultPadding),
          TextFormField(
            validator: RequiredValidator(errorText: requiredField),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
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
                hintText: 'Email'),
            onSaved: (email) {
              _email = email!;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              validator: RequiredValidator(errorText: "Password is required"),
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
              obscureText: true,
              onSaved: (passaword) {
                _password = passaword!;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
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
              child: ref.watch(userProvider).isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text("Sign Up"),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const SignInScreen(),
              ),
            ),
            child: Text.rich(
              TextSpan(
                text: "Already have an account? ",
                children: [
                  TextSpan(
                    text: "Sign in",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(0.64),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
