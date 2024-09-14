import 'dart:io';

import '../../config/app_import.dart';
import '../../config/config_env.dart';
import '../../models/user/user_model.dart';

class ProfilePictureSection extends StatelessWidget {
  final String type;
  final File? imageFile;
  final UserModel? user;
  final VoidCallback onTap;

  const ProfilePictureSection({
    super.key,
    required this.type,
    this.imageFile,
    this.user,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: type == "add"
            ? imageFile != null
                ? CircleAvatar(
                    radius: 80,
                    backgroundColor: AppColor.greyC8,
                    backgroundImage: FileImage(imageFile!),
                  )
                : const CircleAvatar(
                    backgroundColor: AppColor.greyC8,
                    radius: 80,
                    child: Icon(Icons.photo),
                  )
            : imageFile != null
                ? CircleAvatar(
                    radius: 80,
                    backgroundColor: AppColor.greyC8,
                    backgroundImage: FileImage(imageFile!),
                  )
                : CircleAvatar(
                    radius: 80,
                    backgroundColor: AppColor.greyC8,
                    backgroundImage: user?.image?.isNotEmpty ?? false
                        ? NetworkImage(
                            "${AppEnvironment.baseUrl}/images/${user!.image}")
                        : null,
                    child: user?.image?.isEmpty ?? true
                        ? Center(
                            child: AutoText(
                              user!.email![0],
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : null,
                  ),
      ),
    );
  }
}
