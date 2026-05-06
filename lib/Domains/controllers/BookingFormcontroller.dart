import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:snappis/Domains/Entities/ServiceEntities.dart';

class BookingFormController extends GetxController {
  /// Creator Details
  var creatorId = "".obs;
  var creatorName = "".obs;
  var creatorImage = "".obs;
  var creatorFollowers = 0.obs;

  /// Selected Services
  var selectedServices = <ServiceEntity1>[].obs;

  /// Campaign Details
  var campaignName = "".obs;
  var description = "".obs;
  var deadline = "".obs;
  var demoImagePath = "".obs;

  var uploadedFilePath = "".obs;

  /// User Details
  var userName = "".obs;
  var email = "".obs;
  var whatsapp = "".obs;
  var pancard = "".obs;

  var uploadedFileName = "".obs;

  // ✅ Cross-platform file storage (no dart:html)
  PlatformFile? webFile;   // used on Web  (access bytes via webFile!.bytes)
  File? mobileFile;        // used on mobile/desktop (access path via mobileFile!.path)

  // ─────────────────────────────────────────────────────────────────────────

  void setCreator({
    required String id,
    required String name,
    required String image,
    required int followers,
    required String username,
  }) {
    creatorId.value = id;
    creatorName.value = name;
    creatorImage.value = image;
    creatorFollowers.value = followers;
    userName.value = username;
  }

  void setServices(List<ServiceEntity1> services) {
    selectedServices.value = services.where((s) => s.quantity > 0).toList();
  }

  void setCampaignDetails({
    required String name,
    required String desc,
    required String deadlineDate,
    required String imagePath,
  }) {
    campaignName.value = name;
    description.value = desc;
    deadline.value = deadlineDate;
    demoImagePath.value = imagePath;
    print(campaignName.value);
  }

  void setUserDetails({
    required String name,
    required String emailId,
    required String whatsappNo,
    required String pancardNo,
  }) {
    userName.value = name;
    email.value = emailId;
    whatsapp.value = whatsappNo;
    pancard.value = pancardNo;
  }

  void setCampaignName(String value) {
    campaignName.value = value;
  }

  // ✅ Single unified method — works on Web, Android, iOS, Desktop
  Future<void> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        withData: kIsWeb, // load bytes only on web (needed for upload)
      );

      if (result == null || result.files.isEmpty) return;

      final picked = result.files.first;
      uploadedFileName.value = picked.name;

      if (kIsWeb) {
        // Web: no file path exists, use bytes instead
        webFile = picked;
        mobileFile = null;
      } else {
        // Mobile / Desktop: use file path
        if (picked.path != null) {
          mobileFile = File(picked.path!);
          uploadedFilePath.value = picked.path!;
          webFile = null;
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick file: $e');
    }
  }

  // ✅ Kept for backward compatibility — both now call the unified pickFile()
  Future<void> pickFileWeb() async => pickFile();
  Future<void> pickFileMobile() async => pickFile();

  // ── Helpers ───────────────────────────────────────────────────────────────
  bool get hasFile => uploadedFileName.value.isNotEmpty;

  void clearFile() {
    webFile = null;
    mobileFile = null;
    uploadedFileName.value = '';
    uploadedFilePath.value = '';
  }
}