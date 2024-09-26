
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_app/screens/home_screen.dart';

// Mock classes for dependencies if necessary
class MockCatDogCubit extends MockCubit<AnimalModel> implements CatDogCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('displays Cat with clock icon initially', (WidgetTester tester) async {
			// Arrange: Create a mock Cubit and set its initial state
			final mockCubit = MockCatDogCubit();
			whenListen(
				mockCubit,
				Stream.fromIterable([AnimalModel(text: 'Cat', icon: Icons.access_time)]),
				initialState: AnimalModel(text: 'Cat', icon: Icons.access_time),
			);

			// Act: Build the HomeScreen and pump the widget
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CatDogCubit>(
						create: (_) => mockCubit,
						child: HomeScreen(),
					),
				),
			);

			// Assert: Verify the initial state is displayed correctly
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('displays Dog with person icon after tapping', (WidgetTester tester) async {
			// Arrange: Create a mock Cubit and set its state changes
			final mockCubit = MockCatDogCubit();
			whenListen(
				mockCubit,
				Stream.fromIterable([
					AnimalModel(text: 'Cat', icon: Icons.access_time),
					AnimalModel(text: 'Dog', icon: Icons.person),
				]),
				initialState: AnimalModel(text: 'Cat', icon: Icons.access_time),
			);

			// Act: Build the HomeScreen and pump the widget
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CatDogCubit>(
						create: (_) => mockCubit,
						child: HomeScreen(),
					),
				),
			);
			await tester.tap(find.text('Cat'));
			await tester.pump();

			// Assert: Verify the state changes to Dog with person icon
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
