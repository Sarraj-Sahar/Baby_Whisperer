import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:baby_cry/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileDataStoreServiceProvider =
    Provider<ProfileDatastoreService>((ref) {
  return ProfileDatastoreService();
});

class ProfileDatastoreService {
  ProfileDatastoreService();

//Queries the Amplify DataStore for the baby profile and streams its details.
  Stream<BabyProfile> listenToProfile() {
    return Amplify.DataStore.observeQuery(
      BabyProfile.classType,
    ).map((event) => event.items.first).handleError(
      (dynamic error) {
        debugPrint('listenToProfile: A Stream error happened : $error');
      },
    );
  }

  Future<void> updateProfile(BabyProfile updatedProfile) async {
    try {
      final profileWithId = await Amplify.DataStore.query(
        BabyProfile.classType,
        where: BabyProfile.ID.eq(updatedProfile.id),
      );

      final oldProfile = profileWithId.first;
      final newProfile = oldProfile.copyWith(
        // id: updatedProfile.id,
        name: updatedProfile.name,
        birthday: updatedProfile.birthday,
        country: updatedProfile.country,
        zipcode: updatedProfile.zipcode,
        gender: updatedProfile.gender,
      );

      await Amplify.DataStore.save(newProfile);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> addProfile(BabyProfile profile) async {
    try {
      await Amplify.DataStore.save(profile);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }
}
