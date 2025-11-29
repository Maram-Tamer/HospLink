String calculateAgeFromString(String birthDateString) {
  DateTime birthDate = DateTime.parse(birthDateString); // تحويل النص إلى DateTime
  DateTime today = DateTime.now();

  int age = today.year - birthDate.year;

  if (today.month < birthDate.month ||
      (today.month == birthDate.month && today.day < birthDate.day)) {
    age--;
  }

  return age.toString();
}
