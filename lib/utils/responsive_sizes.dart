class Responsive {
  double getResponsiveHeight(
      double pixels, double screenHeight, double baseScreenHeight) {
    return screenHeight * pixels / baseScreenHeight;
  }

  double getResponsiveWidth(
      double pixels, double screenWidth, double baseScreenWidth) {
    return screenWidth * pixels / baseScreenWidth;
  }
}
