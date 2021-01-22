class TimeHelper {
  static String dayFromInt(int day) {
    switch (day) {
      case 1:
        return "lunes";
      case 2:
        return "martes";
      case 3:
        return "miércoles";
      case 4:
        return "jueves";
      case 5:
        return "viernes";
      case 6:
        return "sábado";
      case 7:
        return "domingo";
    }

    return "";
  }

  static int currentDayInt() {
    return DateTime.now().weekday;
  }

  static int currentTimeInMinutes() {
    DateTime now = DateTime.now();
    print("Now: $now");
    return (now.hour*60)+now.minute;
  }
}

extension StringExtension on String {
  String capitalize() {
    if (this.isEmpty) return "";
    if (this.length == 1) return "${this[0].toUpperCase()}";
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
