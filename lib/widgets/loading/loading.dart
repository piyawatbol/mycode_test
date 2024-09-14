import '../../config/app_import.dart';

class LoadingCustom extends StatelessWidget {
  final bool statusLoading;
  const LoadingCustom({super.key, required this.statusLoading});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Visibility(
      visible: statusLoading == true ? true : false,
      child: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: size.width,
              height: size.height,
              color: Colors.black.withOpacity(0.2),
            ),
            Positioned(
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                  // child: Platform.isIOS
                  //     ? CupertinoActivityIndicator(
                  //         radius: 13,
                  //       )
                  //     : CircularProgressIndicator(color: AppColor.green3DB),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
