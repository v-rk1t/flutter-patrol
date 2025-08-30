# Patrol Basics Tutorial

### Learn from :point_right: [this post](https://resocoder.com/patrol-basics-tutorial) :point_left:.

#### _Find more tutorials on [resocoder.com](https://resocoder.com)_

<br />
<br />

[![Reso Coder](https://resocoder.com/wp-content/uploads/2019/09/logo_with_text_signature.png)](https://resocoder.com)
<br />
_Be prepared for **real** app development_

## Huge props to Reso Coder for the starter repository! 💪

## Prerequisite

xcode - https://developer.apple.com/xcode/
android studio - https://developer.android.com/studio
flutter SDK - https://docs.flutter.dev/get-started/install
cocoapods - https://guides.cocoapods.org/using/getting-started.html
patrol - https://patrol.leancode.co/documentation

## to run tests
check flutter conditions: flutter doctor
check patrol conditions: patrol doctor
clean previous build: flutter clean
build iOS simulator: flutter build ios --simulator
open an iOS simulator: open -a Simulator
running with no install: patrol test -t integration_test/app_test.dart --no-uninstall
running with specific device: patrol test --target integration_test/app_test.dart -d "iPhone 16 Plus"