
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/cat_dog_cubit.dart';
import 'screens/home_screen.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Simple Cubit App',
			home: BlocProvider(
				create: (context) => CatDogCubit(),
				child: HomeScreen(),
			),
		);
	}
}
