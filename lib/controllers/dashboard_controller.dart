import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DashboardController extends GetxController {
  var profileImage = 'assets/default_profile.png'.obs; // Foto profil default

  // Method untuk mengganti foto profil
  void updateProfileImage(String newImage) {
    profileImage.value = newImage;
  }
}
