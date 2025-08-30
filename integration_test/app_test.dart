import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_basics_tutorial/main.dart';
import 'package:patrol_basics_tutorial/pages/integration_test_keys.dart';

Future<void> nativePermissionDialogHandler($) async {
  if (await $.native.isPermissionDialogVisible()) {
    await $.native.grantPermissionWhenInUse();
  }
}

void main() {
  patrolTest(
    'signs in, triggers a notification, and taps on it',
    framePolicy: LiveTestWidgetsFlutterBindingFramePolicy.fullyLive,
    ($) async {
      initApp();
      await $.pumpWidgetAndSettle(const MainApp());
      await $(keys.signInPage.emailTextField).enterText('test@email.com');
      await $(keys.signInPage.passwordTextField).enterText('password');
      await $(keys.signInPage.signInButton).tap();
      await nativePermissionDialogHandler($);
      await $(keys.homePage.patrolLogo).waitUntilVisible();
      await $(keys.homePage.notificationIcon).tap();
      await $.native.pressHome();
      await $.native.openNotifications();
      await $.native.tapOnNotificationBySelector(
          Selector(textContains: 'Patrol says hello!'));
      await $(keys.homePage.successSnackbar).waitUntilVisible();
    },
  );

  patrolTest(
    'invalid sign in, triggers an error message, re-login is possible',
    framePolicy: LiveTestWidgetsFlutterBindingFramePolicy.fullyLive,
    ($) async {
      initApp();
      await $.pumpWidgetAndSettle(const MainApp());
      await $(keys.signInPage.emailTextField).enterText('test@email.com');
      await $(keys.signInPage.passwordTextField).enterText('pass');
      await $(keys.signInPage.signInButton).tap();
      await $('Password must be at least 8 characters').waitUntilVisible();
      await $(keys.signInPage.passwordTextField).enterText('password');
      await $(keys.signInPage.signInButton).tap();
      await nativePermissionDialogHandler($);
      await $(keys.homePage.patrolLogo).waitUntilVisible();
    },
  );

  patrolTest(
    'blank sign in, triggers error messages, re-login is possible',
    framePolicy: LiveTestWidgetsFlutterBindingFramePolicy.fullyLive,
    ($) async {
      initApp();
      await $.pumpWidgetAndSettle(const MainApp());
      await $(keys.signInPage.signInButton).tap();
      await $('Please enter a valid email').waitUntilVisible();
      await $('Please enter a password').waitUntilVisible();
      await $(keys.signInPage.emailTextField).enterText('test@email.com');
      await $(keys.signInPage.passwordTextField).enterText('password');
      await $(keys.signInPage.signInButton).tap();
      await nativePermissionDialogHandler($);
      await $(keys.homePage.patrolLogo).waitUntilVisible();
    },
  );
}
