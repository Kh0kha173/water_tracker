double calculateWaterLitres({
  required int weightKg,
  required double activityHours,
}) {
  double baseMl = weightKg * 35;
  double activityMl = activityHours * 250;
  double totalMl = baseMl + activityMl;
  return totalMl / 1000;
}

String getGuidanceText(double litres) {
  if (litres < 2.0) {
    return 'Low estimate in this educational formula. Spread your water intake over the day.';
  } else if (litres <= 3.0) {
    return 'Moderate estimate in this educational formula. Try to drink water regularly.';
  } else {
    return 'High estimate in this educational formula. Adjust based on your daily needs.';
  }
}