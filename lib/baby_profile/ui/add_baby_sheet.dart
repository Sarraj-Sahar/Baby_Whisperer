// import 'package:amplify_trips_planner/features/trip/controller/trips_list_controller.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:baby_cry/baby_profile/controller/baby_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class AddBabyBottomSheet extends ConsumerWidget {
  AddBabyBottomSheet({
    super.key,
  });

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final birthdayController = TextEditingController();
    final countryController = TextEditingController();
    final zipController = TextEditingController();
    final genderController = TextEditingController();

    return SafeArea(
      child: Form(
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
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  const validationError = 'Enter name';
                  if (value == null || value.isEmpty) {
                    return validationError;
                  }

                  return null;
                },
                autofocus: true,
                autocorrect: false,
                decoration: const InputDecoration(hintText: "Enter name"),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: countryController,
                autofocus: true,
                autocorrect: false,
                decoration: const InputDecoration(hintText: "country"),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  } else {
                    return 'Enter a valid country';
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.datetime,
                controller: birthdayController,
                autofocus: true,
                autocorrect: false,
                decoration: const InputDecoration(hintText: "Birthday"),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  } else {
                    return 'Enter a valid date';
                  }
                },
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    birthdayController.text = formattedDate;
                  } else {}
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: zipController,
                autofocus: true,
                autocorrect: false,
                decoration: const InputDecoration(hintText: "zipcode"),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  } else {
                    return 'Enter a valid zipcode';
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: genderController,
                autofocus: true,
                autocorrect: false,
                decoration: const InputDecoration(hintText: "gender"),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  } else {
                    return 'Enter a valid gender';
                  }
                },
              ),
              TextButton(
                  child: const Text('OK'),
                  onPressed: () async {
                    final currentState = formGlobalKey.currentState;
                    if (currentState == null) {
                      return;
                    }
                    if (currentState.validate()) {
                      ref.read(profileControllerProvider).add(
                            name: nameController.text,
                            country: countryController.text,
                            birthday: TemporalDate.fromString(
                                birthdayController.text),
                            zipcode: int.parse(zipController.text),
                            gender: genderController.text,
                          );

                      Navigator.of(context).pushNamed("/home");
                    }
                  } //,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
