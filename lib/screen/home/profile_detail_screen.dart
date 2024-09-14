import 'package:image_picker/image_picker.dart';
import 'package:myorder_test/controllers/profile_controller.dart';
import 'package:myorder_test/models/user/user_model.dart';
import 'package:myorder_test/widgets/dropdown/dropdown_gender.dart';
import 'package:myorder_test/widgets/loading/loading.dart';

import '../../config/app_import.dart';
import '../widget/image_select.dart';

class ProfileDetailScreen extends StatelessWidget {
  final UserModel? user;
  final String? type;

  const ProfileDetailScreen({super.key, this.type = "edit", this.user});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: GetBuilder<ProfileController>(
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: const AutoText(
                "Profile",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              actions: [
                if (type == "edit")
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: controller.deleteUser,
                  ),
              ],
            ),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            ProfilePictureSection(
                              type: type!,
                              imageFile: controller.imageFile,
                              user: user,
                              onTap: () =>
                                  controller.pickImage(ImageSource.gallery),
                            ),
                            const SizedBox(height: 40),
                            const AutoText(
                              "Personal Details",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(height: 20),
                            CustomTextfield(
                              text: "Email Address",
                              controller: controller.emailController,
                              validator: CustomValidators.emailValidator,
                            ),
                            CustomTextfield(
                              text: "Password",
                              controller: controller.passwordController,
                              validator: CustomValidators.passwordValidator,
                            ),
                            GenderDropdown(
                              selectedGender: controller.gender,
                              onChanged: (v) {
                                controller.gender = v.toString();
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 20),
                            const Divider(),
                            const SizedBox(height: 10),
                            const AutoText(
                              "Address Details",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(height: 10),
                            CustomTextfield(
                              text: "Pincode",
                              controller: controller.pincodeController,
                              validator: CustomValidators.pincodeValidator,
                            ),
                            CustomTextfield(
                              text: "Address",
                              controller: controller.addressController,
                              validator: CustomValidators.addressValidator,
                            ),
                            CustomTextfield(
                              text: "City",
                              controller: controller.cityController,
                              validator: CustomValidators.cityValidator,
                            ),
                            CustomTextfield(
                              text: "State",
                              controller: controller.stateController,
                              validator: CustomValidators.stateValidator,
                            ),
                            CustomTextfield(
                              text: "Country",
                              controller: controller.countryController,
                              validator: CustomValidators.countyValidator,
                            ),
                            const Divider(),
                            const SizedBox(height: 10),
                            const AutoText(
                              "Bank Account Details",
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            CustomTextfield(
                              text: "Bank Account Number",
                              controller:
                                  controller.bankAccountNumberController,
                              validator: CustomValidators.backAccountValidator,
                            ),
                            CustomTextfield(
                              text: "Account Holder's Name",
                              controller:
                                  controller.accountHolderNameController,
                              validator: CustomValidators.bankHolderValidator,
                            ),
                            CustomTextfield(
                              text: "IFSC Code",
                              controller: controller.ifscCodeController,
                              validator: CustomValidators.bankIfscValidator,
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: size.width,
                              height: 52,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (controller.gender == "-") {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Please select a gender')),
                                    );
                                  } else {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      type == "edit"
                                          ? controller.updateUser()
                                          : controller.addUser();
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.blue43,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const AutoText(
                                  "Save",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                LoadingCustom(statusLoading: controller.isLoading),
              ],
            ),
          );
        },
      ),
    );
  }
}
