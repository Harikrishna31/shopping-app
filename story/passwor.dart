validator(String controller) {
  if (controller.length < 5) {
    return null;
  } else {
    return 'enter max 5';
  }
}
String? usernamevalidate(String? value) {
  if (value == null || value.isEmpty) {
    return " Please Enter Name ";
  } else {
    return null;
  }
}