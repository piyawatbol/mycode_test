import 'package:myorder_test/config/config_env.dart';
import 'package:myorder_test/controllers/profile_controller.dart';
import 'package:myorder_test/models/user/user_model.dart';
import 'package:myorder_test/screen/home/profile_detail_screen.dart';
import '../../config/app_import.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        return Scaffold(
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: size.width,
            height: size.height,
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  buildUserList(controller)
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.greyC8,
            onPressed: () {
              controller.clearController();
              Get.to(() => const ProfileDetailScreen(type: "add"));
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  SizedBox buildUserList(ProfileController controller) {
    var size = MediaQuery.of(Get.context!).size;
    return SizedBox(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: controller.userList.length,
        itemBuilder: (BuildContext context, int index) {
          UserModel user = controller.userList[index];
          return GestureDetector(
            onTap: () {
              controller.setController(user);
              Get.to(() => ProfileDetailScreen(user: user));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: const Offset(2, 2),
                  )
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColor.greyC8,
                    backgroundImage: user.image != ""
                        ? NetworkImage(
                            "${AppEnvironment.baseUrl}/images/${user.image}",
                          )
                        : null,
                    child: user.image == ""
                        ? Center(
                            child: AutoText(
                              user.email![0],
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoText(
                        "${user.email}",
                      ),
                      const SizedBox(height: 5),
                      AutoText(
                        "Address : ${user.address}",
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
