
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_cubit_app/cubits/cat_dog_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MockCatDogCubit extends MockCubit<AnimalModel> implements CatDogCubit {}

void main() {
	group('CatDogCubit', () {
		late CatDogCubit catDogCubit;

		setUp(() {
			catDogCubit = CatDogCubit();
		});

		tearDown(() {
			catDogCubit.close();
		});

		test('initial state is Cat with clock icon', () {
			expect(catDogCubit.state.text, 'Cat');
			expect(catDogCubit.state.icon, Icons.access_time);
		});

		blocTest<CatDogCubit, AnimalModel>(
			'emits Dog with person icon when toggleAnimal is called once',
			build: () => catDogCubit,
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [
				AnimalModel(text: 'Dog', icon: Icons.person),
			],
		);

		blocTest<CatDogCubit, AnimalModel>(
			'emits Cat with clock icon when toggleAnimal is called twice',
			build: () => catDogCubit,
			act: (cubit) {
				cubit.toggleAnimal();
				cubit.toggleAnimal();
			},
			expect: () => [
				AnimalModel(text: 'Dog', icon: Icons.person),
				AnimalModel(text: 'Cat', icon: Icons.access_time),
			],
		);
	});
}
