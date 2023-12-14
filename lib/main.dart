import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/presentation/bloc/image_bloc.dart';
import 'package:gallery_app/presentation/bloc/image_events.dart';
import 'package:gallery_app/presentation/bloc/image_states.dart';
import 'package:gallery_app/presentation/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<ImageBloc>(create: (context) => ImageBloc(LoadingImages())..add(LoadImages()),
      child: const HomePage(),),
    );
  }
}