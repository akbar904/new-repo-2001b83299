
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.simple_cubit_app/models/animal_model.dart';

void main() {
	group('AnimalModel', () {
		test('should create a valid AnimalModel instance', () {
			final animalModel = AnimalModel(text: 'Cat', icon: Icons.access_time);

			expect(animalModel.text, 'Cat');
			expect(animalModel.icon, Icons.access_time);
		});

		test('should correctly serialize and deserialize AnimalModel', () {
			final animalModel = AnimalModel(text: 'Dog', icon: Icons.person);

			final json = animalModel.toJson();
			final deserializedAnimalModel = AnimalModel.fromJson(json);

			expect(deserializedAnimalModel.text, 'Dog');
			expect(deserializedAnimalModel.icon, Icons.person);
		});
	});
}
