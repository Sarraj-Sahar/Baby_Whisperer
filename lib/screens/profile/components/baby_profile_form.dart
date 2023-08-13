import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:baby_cry/models/BabyProfile.dart';
import 'package:baby_cry/providers/user_provider.dart';
import 'package:baby_cry/repositories/baby_repository.dart';
import 'package:baby_cry/screens/welcome/welcome_screen.dart';
import 'package:baby_cry/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

// NOTE:
//@sahar NOT CURRENTLY BEING USED TO MINIMIZE BOILERPLATE CODE

class BabyProfileForm extends ConsumerStatefulWidget {
  const BabyProfileForm({
    Key? key,
    required this.babyProfile,
  }) : super(key: key);
  final BabyProfile? babyProfile;

  @override
  ConsumerState<BabyProfileForm> createState() => _BabyProfileFormState();
}

// The babyProfileForm's UI is a consumer widget
class _BabyProfileFormState extends ConsumerState<BabyProfileForm> {
  final _formKey = GlobalKey<FormState>();
  late String _username, _email, _password;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final String gender = "girl";

  @override
  Widget build(BuildContext context) {
    //watching
    final profileValue = ref.watch(profileStreamProvider);

    return
        //TODO :  add ===> profileValue.when(
        // data: (profile) => ListView(
        Column(
      children: [
        Form(
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
                padding: const EdgeInsets.only(top: 75),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(kprimaryColor)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // signUp(_username, _password, _email);
                    }
                  },
                  child: context.watch<UserProvider>().isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Save"),
                ),
              ),
            ],
          ),
        ),

        //added sign out button
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: IconButton(
                onPressed: () async {
                  final response = await context.read<UserProvider>().signOut();
                  response.fold(
                    (error) => context.showError(error),
                    (result) {
                      if (result is CognitoCompleteSignOut) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WelcomeScreen(),
                          ),
                          (route) => false,
                        );
                      }
                    },
                  );
                },
                icon: context.watch<UserProvider>().isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Icon(Icons.logout_outlined),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
