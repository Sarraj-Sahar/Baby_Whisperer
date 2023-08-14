import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:baby_cry/baby_profile/controller/baby_controller.dart';
import 'package:baby_cry/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditProfileBottomSheet extends ConsumerWidget {
  EditProfileBottomSheet({
    required this.profile,
    super.key,
  });

  final BabyProfile profile;

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController =
        TextEditingController(text: profile.name != null ? profile.name! : '');
    final birthdayController = TextEditingController(
        text: profile.birthday != null ? profile.birthday.toString()! : '');
    final countryController = TextEditingController(
        text: profile.country != null ? profile.country! : '');
    final zipController = TextEditingController(
        text: profile.zipcode != null ? profile.zipcode.toString()! : '');
    final genderController = TextEditingController(
        text: profile.gender != null ? profile.gender! : '');

    return Form(
      key: formGlobalKey,
      child: Container(
        padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 15),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //name
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.name,
              validator: (value) {
                const validationError = 'Enter a valid name';
                if (value == null || value.isEmpty) {
                  return validationError;
                }

                return null;
              },
              autofocus: true,
              autocorrect: false,
              decoration: const InputDecoration(hintText: "Name"),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 20,
            ),
            //birthday
            TextFormField(
              keyboardType: TextInputType.name,
              controller: birthdayController,
              autofocus: true,
              autocorrect: false,
              decoration: const InputDecoration(hintText: "Birthday"),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return 'Enter a valid birthdate';
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),

            //country
            TextFormField(
              keyboardType: TextInputType.name,
              controller: countryController,
              autofocus: true,
              autocorrect: false,
              decoration: const InputDecoration(hintText: "Country"),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return 'Enter a valid country';
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            //zipcode
            TextFormField(
              keyboardType: TextInputType.number,
              controller: zipController,
              autofocus: true,
              autocorrect: false,
              decoration: const InputDecoration(hintText: "ZipCode"),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return 'Enter zipcode';
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            //gender
            TextFormField(
              keyboardType: TextInputType.text,
              controller: genderController,
              autofocus: true,
              autocorrect: false,
              decoration: const InputDecoration(hintText: "gender"),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return 'Enter gender';
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            //save changes
            TextButton(
                child: const Text('OK'),
                onPressed: () async {
                  final currentState = formGlobalKey.currentState;
                  if (currentState == null) {
                    return;
                  }
                  if (currentState.validate()) {
                    final updatedProfile = profile.copyWith(
                      name: nameController.text,
                      birthday:
                          TemporalDate.fromString(birthdayController.text),
                      country: countryController.text,
                      zipcode: int.parse(zipController.text),
                      gender: genderController.text,
                    );
                    ref.read(profileControllerProvider).edit(updatedProfile);
                    Navigator.of(context).pop();
                  }
                } //,
                ),
          ],
        ),
      ),
    );
  }
}
