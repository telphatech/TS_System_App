# TS System App

Personal Project of Telphatech LLP

# RUN A PROJECT

flutter clean
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter run --flavor dev -t lib/main_dev.dart

# TO BUILD APK

flutter clean
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter build apk --release --flavor dev -t lib/main_dev.dart
