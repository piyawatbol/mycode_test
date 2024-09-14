import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myorder_test/models/user/user_model.dart';
import 'package:myorder_test/services/apis/user_api.dart';

import '../config/app_import.dart';

class ProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController bankAccountNumberController = TextEditingController();
  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();

  List<UserModel> userList = [];

  String? userId;
  String gender = "";

  bool isLoading = false;
  File? imageFile;
  XFile? pickedFile;

  @override
  void onInit() {
    getAllUser();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    pincodeController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    countryController.dispose();
    bankAccountNumberController.dispose();
    accountHolderNameController.dispose();
    ifscCodeController.dispose();
    super.onClose();
  }

  pickImage(ImageSource image) async {
    final ImagePicker picker = ImagePicker();
    pickedFile = await picker.pickImage(source: image);
    if (pickedFile != null) {
      imageFile = File(pickedFile!.path);
      update();
    }
  }

  getAllUser() async {
    userList.clear();
    final response = await UserApi.getAllUser();
    if (response.isSucces) {
      if (response.isSucces) {
        userList.addAll(response.data
            .map<UserModel>((values) => UserModel.fromJson(values)));
      }
    }
    update();
  }

  Future<void> updateUser() async {
    isLoading = true;
    update();
    final body = FormData.fromMap({
      "email": emailController.text,
      "password": passwordController.text,
      "sex": gender,
      "pincode": pincodeController.text,
      "address": addressController.text,
      "city": cityController.text,
      "state": stateController.text,
      "country": countryController.text,
      "bank_account_number": bankAccountNumberController.text,
      "account_holder_name": accountHolderNameController.text,
      "ifsc_code": ifscCodeController.text,
    });

    if (imageFile != null) {
      body.files.add(MapEntry(
        "image",
        MultipartFile.fromFileSync(imageFile!.path),
      ));
    }

    final response = await UserApi.updateUser(userId, body);
    if (response.isSucces) {
      getAllUser();
      Get.back();
    }
    isLoading = false;
    update();
  }

  Future<void> addUser() async {
    isLoading = true;
    update();

    final body = FormData.fromMap({
      "email": emailController.text,
      "password": passwordController.text,
      "sex": gender,
      "pincode": pincodeController.text,
      "address": addressController.text,
      "city": cityController.text,
      "state": stateController.text,
      "country": countryController.text,
      "bank_account_number": bankAccountNumberController.text,
      "account_holder_name": accountHolderNameController.text,
      "ifsc_code": ifscCodeController.text,
    });

    if (imageFile != null) {
      body.files.add(MapEntry(
        "image",
        MultipartFile.fromFileSync(imageFile!.path),
      ));
    }

    final response = await UserApi.addUser(body);
    if (response.isSucces) {
      getAllUser();
      Get.back();
    }

    isLoading = false;
    update();
  }

  deleteUser() async {
    isLoading = true;
    update();
    final response = await UserApi.delete(userId);
    if (response.isSucces) {
      getAllUser();
      Get.back();
    }
    isLoading = false;
    update();
  }

  setController(UserModel user) {
    imageFile = null;
    userId = user.sId;
    emailController.text = user.email ?? '';
    passwordController.text = user.password ?? '';
    gender = user.sex.toString();
    Log.show(gender);
    pincodeController.text = user.pincode ?? '';
    addressController.text = user.address ?? '';
    cityController.text = user.city ?? '';
    stateController.text = user.state ?? '';
    countryController.text = user.country ?? '';
    bankAccountNumberController.text = user.bankAccountNumber ?? '';
    accountHolderNameController.text = user.accountHolderName ?? '';
    ifscCodeController.text = user.ifscCode ?? '';
    update();
  }

  clearController() {
    imageFile = null;
    userId = "";
    emailController.clear();
    passwordController.clear();
    gender = "-";
    pincodeController.clear();
    addressController.clear();
    cityController.clear();
    stateController.clear();
    countryController.clear();
    bankAccountNumberController.clear();
    accountHolderNameController.clear();
    ifscCodeController.clear();
    update();
  }
}
