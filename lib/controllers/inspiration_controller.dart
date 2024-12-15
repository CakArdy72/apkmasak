import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InspirationController extends GetxController {
  var isConnected = true.obs;
  var isUploading = false.obs;
  final GetStorage storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _checkConnection();
  }

  // Mengecek status koneksi internet
  void _checkConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    isConnected.value = connectivityResult != ConnectivityResult.none;

    // Listen to connectivity changes
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      isConnected.value = result != ConnectivityResult.none;
      if (isConnected.value) {
        _uploadOfflineData();
      }
      Get.snackbar(
        isConnected.value ? 'Terhubung ke Internet' : 'Tidak ada koneksi',
        '',
        backgroundColor: isConnected.value ? Colors.green : Colors.red,
        colorText: Colors.white,
      );
    });
  }

  // Menyimpan data secara offline
  void saveOfflineData(Map<String, dynamic> data) {
    storage.write('offline_data', data);
  }

  // Melanjutkan upload ketika terhubung ke internet
  Future<void> _uploadOfflineData() async {
    if (storage.read('offline_data') != null) {
      var data = storage.read('offline_data');
      await _uploadDataToFirestore(data);
      storage.remove('offline_data');
    }
  }

  // Upload data ke Firestore
  Future<void> _uploadDataToFirestore(Map<String, dynamic> data) async {
    try {
      isUploading.value = true;
      await FirebaseFirestore.instance.collection('inspirations').add(data);
      Get.snackbar('Upload Sukses', 'Data berhasil diupload');
    } catch (e) {
      Get.snackbar('Gagal Upload', 'Terjadi kesalahan saat upload');
    } finally {
      isUploading.value = false;
    }
  }
}
