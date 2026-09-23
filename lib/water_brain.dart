import 'dart:math';

class WaterBrain {
  final int weight;
  final int age;
  final int activityLevel; // 1-5
  final String gender;
  late double _waterIntake;

  WaterBrain({
    required this.gender,
    required this.age,
    required this.weight,
    required this.activityLevel,
  });
  String calculateWater() {
    // Base = weight * 0.033 litres
    // Activity bonus = activityLevel * 0.35
    // Gender: male +0.3, female stays same
    // Age > 55: reduce by 0.2

    _waterIntake = weight * 0.033; //Base
    _waterIntake += activityLevel * 0.35; //Activity Bonus
    if (gender.toLowerCase() == 'male') {
      _waterIntake += 0.3; //Male bonus
    }
    if (age > 55) {
      _waterIntake -= 0.2; // Age reduction
    }
    return _waterIntake.toStringAsFixed(2); //2 decimal
  }

  String getSatuts() {
    // < 2.0 → "Low 🔴"
    // 2.0 - 3.0 → "Sufficient ✅"
    // > 3.0 → "High 💧"

    if (_waterIntake >= 3.0) {
      return "High 💧";
    } else if (_waterIntake >= 2.0) {
      return "Sufficient ✅";
    } else {
      return "Low Hyderation 🔴";
    }
  }

  String getAdvice() {
    if (_waterIntake >= 3.0) {
      return "You have a higher than normal body weight. Try to exercise more water.";
    } else if (_waterIntake > 2.0) {
      return "You have a normal WaterIntake, Good Job!";
    } else {
      return "You have a lower than normal waterIntake, you can drink a bit more.";
    }
  }

  String getActivityLabel() {
    switch (activityLevel) {
      case 1:
        return "Sedentary 🪑";
      case 2:
        return "Light 🚶";
      case 3:
        return "Moderate 🏃";
      case 4:
        return "Active 💪";
      case 5:
        return "Very Active 🏋️";
      default:
        return "Unknown";
    }
  }
}
