import '../../config/app_import.dart';

class CustomTextfield extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const CustomTextfield({
    super.key,
    required this.text,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoText(
            text,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColor.greyC8,
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
