import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  // Menyimpan foto profil yang akan ditampilkan
  var profileImage = ''.obs;

  // Fungsi untuk memperbarui gambar profil
  void updateProfileImage(String newImage) {
    profileImage.value = newImage;
  }

  // Fungsi untuk memperbarui informasi lainnya seperti nama, email, dsb
  var name = ''.obs;
  var email = ''.obs;

  void updateUserInfo(String newName, String newEmail) {
    name.value = newName;
    email.value = newEmail;
  }
}
