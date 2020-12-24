String formatRole(String role) {
  String firtsChar = role[0].toUpperCase();
  String restRole = role.substring(1, role.length);
  return "$firtsChar$restRole";
}
