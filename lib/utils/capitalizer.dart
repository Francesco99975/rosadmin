String capitalizer(String text) {
  if (text.isEmpty) {
    return text;
  }
  return text[0].toUpperCase() + text.substring(1);
}

double calculateFontSize(double screenWidth) {
  const double baseWidth = 650.0; // baseline screen width
  const double baseFontSize = 12.0; // base font size at baseline width
  const double scalingFactor = 0.15; // how much the font grows per pixel

  double fontSize = baseFontSize + (screenWidth - baseWidth) * scalingFactor;

  // Optional: Set minimum and maximum font size limits
  fontSize = fontSize.clamp(8.0, 16.0); // Minimum 12, maximum 24

  return fontSize;
}
