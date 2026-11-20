# Water Tracker

A Flutter app that helps you track your daily water intake and stay hydrated. Enter your gender, daily activity hours, weight and age, and the app estimates your recommended daily water intake and shows it on a separate result screen.

## Features

- Input screen with gender selection cards (one selectable, highlighted when active)
- Activity slider (0-8 hours/day) showing the current value
- Weight and age stepper cards with + and - buttons within sensible limits
- Input validation with a warning when no gender is selected
- Result screen with the estimated intake, a guidance message, and a summary of your inputs
- Re-calculate button to go back and adjust your inputs
- Dark theme UI with a water-cyan accent

## Screenshots

| Input Screen | Result Screen |
|---|---|
| ![Input Screen](screenshots/input_screen.jpg) | ![Result Screen](screenshots/result_screen.jpg) |

## How the calculation works

The estimate uses a simple educational formula (not a medical standard):

```
baseMl     = weightKg * 35          // base daily need
activityMl = activityHours * 250    // extra for physical activity
totalMl    = baseMl + activityMl
litres     = totalMl / 1000         // shown with two decimals, e.g. 2.95 L / Day
```

Example: 70 kg and 2 h of activity -> (70*35 + 2*250) / 1000 = 2.95 L / Day

The calculation lives in its own function. Gender and age are collected for the UI and shown in the summary but do not change the result. The output is an estimate for educational purposes only, not personal medical advice.

## Widgets and concepts used

- `StatefulWidget` and `setState()` for interactive UI
- `Card` for the gender, weight and age sections
- `Slider` for daily activity hours
- `IconButton` for the +/- steppers
- `ElevatedButton` for Calculate and Re-calculate
- `Navigator.push()` / `Navigator.pop()` for navigation and passing data between screens
- `SnackBar` for the validation warning
- `ThemeData.dark()` with a custom cyan accent color

## How to run

1. Install Flutter: https://docs.flutter.dev/get-started/install
2. Clone this repository: `git clone https://github.com/Kh0kha173/water_tracker`
3. Get dependencies: `flutter pub get`
4. Run the app: `flutter run` and choose a device (phone, emulator, or Chrome)
