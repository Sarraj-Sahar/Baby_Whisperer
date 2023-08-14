import 'package:baby_cry/providers/user_provider.dart';
import 'package:baby_cry/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'components/logo_with_title.dart';
import 'package:baby_cry/shared/shared.dart';

class VerificationScreen extends ConsumerStatefulWidget {
  const VerificationScreen(
      {Key? key, required this.username, required this.password})
      : super(key: key);

  final String username;
  final String password;

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends ConsumerState<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _otpCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackground,
      body: LogoWithTitle(
        title: 'Verification',
        subText: "Verification code has been sent to your mail",
        children: [
          const SizedBox(height: defaultPadding),
          Form(
            key: _formKey,
            child: TextFormField(
              onSaved: (otpCode) {
                _otpCode = otpCode!;
              },
              validator: RequiredValidator(errorText: requiredField),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.send,
              decoration: const InputDecoration(hintText: "Enter OTP"),
            ),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(kprimaryColor)),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                final result = await ref.read(userProvider).confirmSignUp(
                    username: widget.username,
                    password: widget.password,
                    code: _otpCode);
                result.fold(
                  (error) => context.showError(error),
                  (isConfirmed) {
                    if (isConfirmed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text("User has been confirmed"),
                          action: SnackBarAction(
                            label: "complete profile",
                            onPressed: () {
                              //TAKEOFF : automatic sign in after succesful sign up
                              //  SignInForm().signIn(
                              //       username: widget.username,
                              //       password: widget.password);
                              /////////////////

                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(
                                    selectedIndex: 1,
                                  ),
                                ),
                                (route) => false,
                              );
                            },
                          ),
                        ),
                      );
                    }
                  },
                );
              }
            },
            child: ref.watch(userProvider).isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text("Validate"),
          ),
        ],
      ),
    );
  }
}
