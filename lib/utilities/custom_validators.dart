class CustomValidators {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอก email';
    }
    const emailPattern = r'\w+@\w+\.\w+';
    if (!RegExp(emailPattern).hasMatch(value)) {
      return 'กรุณากรอก email ที่ถูกต้อง';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอก password';
    }
    if (value.length < 6) {
      return 'รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร';
    }
    return null;
  }

  static String? sexValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอกเพศ';
    }
    return null;
  }

  static String? pincodeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอก pincode';
    }
    if (value.length != 6) {
      return 'pincode ต้องมี 6 หลัก';
    }
    return null;
  }

  static String? addressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอกท address';
    }
    return null;
  }

  static String? cityValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอก city';
    }
    return null;
  }

  static String? stateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอก state';
    }
    return null;
  }

  static String? countyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอก county';
    }
    return null;
  }

  static String? backAccountValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอก back account';
    }
    return null;
  }

  static String? bankHolderValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอก bank holder name';
    }
    return null;
  }

  static String? bankIfscValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'กรุณากรอก IFSC Code';
    }
    return null;
  }
}
