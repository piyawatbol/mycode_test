import 'package:myorder_test/config/app_import.dart';

class GenderDropdown extends StatelessWidget {
  final String? selectedGender;
  final ValueChanged<String?> onChanged;

  const GenderDropdown({
    super.key,
    required this.selectedGender,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final List<String> genderOptions = ['-', 'Male', 'Female'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoText(
          "Sex",
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.greyC8, width: 1),
              borderRadius: BorderRadius.circular(8.0)),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          width: size.width,
          child: DropdownButton<String>(
            value: selectedGender,
            underline: const SizedBox(),
            isExpanded: true,
            hint: const Text('Select Gender'),
            onChanged: onChanged,
            items: genderOptions.map((String gender) {
              return DropdownMenuItem<String>(
                value: gender,
                child: Text(gender),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
