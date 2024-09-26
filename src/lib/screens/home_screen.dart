
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/cat_dog_cubit.dart';
import '../models/animal_model.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Simple Cubit App'),
			),
			body: BlocBuilder<CatDogCubit, AnimalModel>(
				builder: (context, state) {
					return Center(
						child: GestureDetector(
							onTap: () => context.read<CatDogCubit>().toggleAnimal(),
							child: Column(
								mainAxisAlignment: MainAxisAlignment.center,
								children: [
									Text(state.text),
									Icon(state.icon),
								],
							),
						),
					);
				},
			),
		);
	}
}
