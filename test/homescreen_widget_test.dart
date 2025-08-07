import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:readback/core/constants/app_strings.dart';
import 'package:readback/features/profile/view/animated_widget.dart';
import 'package:readback/generated/assets.dart';

void main() {
  // It's good practice to initialize EasyLocalization for tests
  // This setup ensures that your AppStrings.someString.tr() calls work.
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    // Initialize EasyLocalization for testing.
    // You might need to adjust the path and supportedLocales
    // to match your app's configuration.
    await EasyLocalization.ensureInitialized();
  });

  testWidgets('HomeScreen renders correctly and shows key widgets',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // Wrap with ScreenUtilInit and MockEasyLocalization for proper rendering
    /*await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(375, 812), // Your design size
          builder: (context, child) => MockEasyLocalization(
            child: const HomeScreen(),
          ),
        ),
      ),
    );*/



    // Verify that the "Skill Level" text is present.
    // Ensure that AppStrings.skillLevel is loaded correctly.
    // If you have issues with .tr(), you might need to ensure EasyLocalization
    // is properly initialized or mock its behavior.
    expect(find.text(AppStrings.skillLevel.tr()), findsOneWidget);

    await tester.drag(
        find.byType(SingleChildScrollView), const Offset(0, -300)); // Drag down
    await tester.pumpAndSettle(); // Wait for animations to complete

    // Add more specific assertions as needed for your HomeScreen's functionality.
  });
}
