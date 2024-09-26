
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_cubit_app/models/animal_model.dart';
import 'package:flutter/material.dart';

class CatDogCubit extends Cubit<AnimalModel> {
	CatDogCubit() : super(AnimalModel(text: 'Cat', icon: Icons.access_time));
	
	void toggleAnimal() {
		if (state.text == 'Cat') {
			emit(AnimalModel(text: 'Dog', icon: Icons.person));
		} else {
			emit(AnimalModel(text: 'Cat', icon: Icons.access_time));
		}
	}
}
