class InputValidation {
  // 🔹 Name Validation
  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your name";
    } else if (value.trim().length < 3) {
      return "Name must be at least 3 characters";
    }
    return null;
  }

  // 🔹 Email Validation
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your email";
    }
    String pattern =
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'; // simple email regex
    if (!RegExp(pattern).hasMatch(value.trim())) {
      return "Please enter a valid email";
    }
    return null;
  }

  // 🔹 Phone Validation
  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter your phone number";
    }
    String pattern = r'^[0-9]{10}$'; // 10 digit only
    if (!RegExp(pattern).hasMatch(value.trim())) {
      return "Enter a valid 10-digit phone number";
    }
    return null;
  }

  // 🔹 Subject Validation
  static String? subject(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter subject";
    } else if (value.trim().length < 3) {
      return "Subject must be at least 3 characters";
    }
    return null;
  }

  // 🔹 Message Validation
  static String? message(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please enter message";
    } else if (value.trim().length < 10) {
      return "Message must be at least 10 characters";
    }
    return null;
  }
}
