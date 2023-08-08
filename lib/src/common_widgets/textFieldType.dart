enum InputTypeEnum {
  text,
  integer,
  float,
  email,
  phoneNumber,
}

class InputTypeDto {
  final InputTypeEnum type;
  final int? maxlength;
  final int? minlength;
  final bool? canHaveCapital;
  final bool? canHaveSmall;
  final bool? canHaveSpecial;
  final int? max;
  final int? min;
  final bool? canNegititve;

  InputTypeDto({
    required this.type,
    this.maxlength,
    this.minlength,
    this.canHaveCapital,
    this.canHaveSmall,
    this.canHaveSpecial,
    this.max,
    this.min,
    this.canNegititve,
  });
}

bool validateEmail(email) {
  final RegExp emailRegex =
      RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  return emailRegex.hasMatch(email);
}

bool checkForLowerCasePresence(word) {
  final RegExp lowercaseRegex = RegExp(r'[a-z]');
  return lowercaseRegex.hasMatch(word);
}

bool checkForUpperCasePresence(word) {
  final RegExp uppercaseRegex = RegExp(r'[A-Z]');
  return uppercaseRegex.hasMatch(word);
}

bool checkForSpecialCharPresence(word) {
  final RegExp specialCharPresence = RegExp(r'[^a-zA-Z0-9]');
  return specialCharPresence.hasMatch(word);
}

bool checkForNumberPresence(word) {
  final RegExp numberRegex = RegExp(r'\d');
  return numberRegex.hasMatch(word);
}

String validateInteger(dynamic value, Map<String, dynamic> conditions) {
  try {
    if (int.parse(value).runtimeType != int) {
      return "value must be integer";
    }

    if (conditions["canNegititve"] == false && int.parse(value) < 0) {
      return "value must not be negitive";
    }
    // is max or  defined or not
    if (conditions["max"] != null &&
        conditions["max"] != "" &&
        int.parse(value) > conditions["max"]) {
      return "value must be smaller than ${conditions['max']}";
    }
    if (conditions["min"] != null &&
        conditions["min"] != "" &&
        int.parse(value) < conditions["min"]) {
      return "value must be greater than ${conditions['min']}";
    }
    return "";
  } catch (err) {
    return "value must be integer";
  }
}

String validateFloat(dynamic value, Map<String, dynamic> conditions) {
  try {
    // dont remove this
    // this statement will throw an error whem
    // inmcomming value is of type other than int and double
    // value = double.parse(value);

    if (![int, double].contains(double.parse(value).runtimeType)) {
      return "value must be integer / double";
    }

    if (conditions["canNegititve"] == false && double.parse(value) < 0) {
      return "value must not be negitive";
    }
    // is max or  defined or not
    if (conditions["max"] != null &&
        conditions["max"] != "" &&
        double.parse(value) > conditions["max"]) {
      return "value must be smaller than ${conditions['max']}";
    }
    if (conditions["min"] != null &&
        conditions["min"] != "" &&
        double.parse(value) < conditions["min"]) {
      return "value must be greater than ${conditions['min']}";
    }
    return "";
  } catch (err) {
    return "value must be double";
  }
}

String validateValue(dynamic value, Map<String, dynamic> conditions) {
  // if we implement toast
  // var errors = []; errors.add()
  // checking for empty
  // assuming that, this function is calling only when a field is required
  if (value.isEmpty) {
    return "This field is required";
  }

  if (conditions["type"].toString() == "InputTypeEnum.integer") {
    return validateInteger(value, conditions);
  }
  if (conditions["type"].toString() == "InputTypeEnum.float") {
    return validateFloat(value, conditions);
  }

  if (conditions["type"].toString() == "InputTypeEnum.text") {
    if (conditions["maxlength"] != null &&
        conditions["maxlength"] != "" &&
        value.length > conditions["maxlength"]) {
      return "Number of character must be smaller than ${conditions['maxlength']}";
    }
    if (conditions["minlength"] != null &&
        conditions["minlength"] != "" &&
        value.length < conditions["minlength"]) {
      return "Number of character must be greater than ${conditions['minlength']}";
    }
  }
  return "";
}
