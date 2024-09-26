
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'lib/main.dart';

void main() {
	group('Main app initialization', () {
		testWidgets('App starts with HomeScreen', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			// Verify if HomeScreen is displayed
			expect(find.byType(HomeScreen), findsOneWidget);
		});
	});
}
