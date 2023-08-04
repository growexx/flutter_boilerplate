extension MobileValidator on String {
  bool isValidMobile() {
    return RegExp(
        '/^([+]d{2})?d{10}\$/')
        .hasMatch(this);
  }
}