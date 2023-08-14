import 'package:baby_cry/baby_profile/data/baby_repository.dart';
import 'package:baby_cry/models/ModelProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;

//The UI will use the controller to edit the details of the profile.

final profileControllerProvider = Provider<ProfileController>((ref) {
  return ProfileController(ref);
});

final profileProvider = StreamProvider.autoDispose<BabyProfile>((ref) {
  final profcontrollerProvider = ref.watch(profileControllerProvider);
  return profcontrollerProvider.listenToProfile();
});

class ProfileController {
  ProfileController(this.ref);
  final Ref ref;

  Future<void> add({
    required String name,
    required amplify_core.TemporalDate birthday,
    required String country,
    required int zipcode,
    required String gender,
  }) async {
    BabyProfile baby = BabyProfile(
      name: name,
      birthday: birthday,
      country: country,
      zipcode: zipcode,
      gender: gender,
    );

    final babyRepository = ref.read(profileRepositoryProvider);

    await babyRepository.add(baby);
  }

  Stream<BabyProfile> listenToProfile() {
    return ref.read(profileRepositoryProvider).listenToProfile();
  }

  Future<void> edit(BabyProfile updatedProfile) async {
    await ref.read(profileRepositoryProvider).update(updatedProfile);
  }
}
