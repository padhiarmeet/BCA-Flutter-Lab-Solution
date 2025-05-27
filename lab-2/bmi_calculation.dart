import 'dart:io';

void main() {
  stdout.write("Enter your weight in pounds: ");
  double weightInPounds = double.parse(stdin.readLineSync()!);

  stdout.write("Enter your height in inches: ");
  double heightInInches = double.parse(stdin.readLineSync()!);

  // Convert to metric units
  double weightInKg = weightInPounds * 0.45359237;
  double heightInMeters = heightInInches * 0.0254;

  // Calculate BMI
  double bmi = weightInKg / (heightInMeters * heightInMeters);

  // Display BMI
  print("Your BMI is: ${bmi}");
}
